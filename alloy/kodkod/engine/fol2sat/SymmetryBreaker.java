/*
 * Kodkod -- Copyright (c) 2005-present, Emina Torlak
 * Pardinus -- Copyright (c) 2013-present, Nuno Macedo, INESC TEC
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package kodkod.engine.fol2sat;

import static kodkod.ast.RelationPredicate.Name.ACYCLIC;
import static kodkod.ast.RelationPredicate.Name.TOTAL_ORDERING;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import kodkod.ast.Formula;
import kodkod.ast.Relation;
import kodkod.ast.RelationPredicate;
import kodkod.ast.RelationPredicate.Name;
import kodkod.engine.bool.BooleanAccumulator;
import kodkod.engine.bool.BooleanConstant;
import kodkod.engine.bool.BooleanFactory;
import kodkod.engine.bool.BooleanMatrix;
import kodkod.engine.bool.BooleanValue;
import kodkod.engine.bool.Operator;
import kodkod.engine.config.Options;
import kodkod.engine.config.Reporter;
import kodkod.instance.Bounds;
import kodkod.instance.PardinusBounds;
import kodkod.instance.Tuple;
import kodkod.instance.TupleFactory;
import kodkod.util.ints.IndexedEntry;
import kodkod.util.ints.IntIterator;
import kodkod.util.ints.IntSet;
import kodkod.util.ints.Ints;

/**
 * Breaks symmetries for a given problem.  Symmetries
 * are broken for total orders, acyclic relations, and 
 * via a generic lex-leader predicate.
 * 
 * @specfield bounds: Bounds // problem bounds
 * @specfield symmetries: set IntSet 
 * @specfield broken: set RelationPredicate 
 * @author Emina Torlak
 * @modified Nuno Macedo // [HASLab] decomposed model finding
 */
final class SymmetryBreaker {
	private final Bounds stage_bounds; // [HASLab]
	private final Bounds bounds;
	private final Set<IntSet> symmetries;
	private final int usize;
	private final Reporter reporter; // [HASLab]
	
	/**
	 * Constructs a new symmetry breaker for the given Bounds, and calls 
	 * the given reporter's {@linkplain Reporter#detectedSymmetries(Set)} method
	 * with the detected symmetries.
	 * <b>Note that the constructor does not make a local copy of the given
	 * bounds, so the caller must ensure that all modifications of the
	 * given bounds are symmetry preserving.</b>  
	 * @ensures reporter.detectedSymmetries(this.symmteries')
	 * @ensures this.bounds' = bounds && this.symmetries' = SymmetryDetector.partition(bounds) && no this.broken'
	 **/
	SymmetryBreaker(Bounds bounds, Reporter reporter) {
		// [HASLab] everything must be resolved at this stage
		if (bounds instanceof PardinusBounds) {
			assert ((PardinusBounds) bounds).resolved();
			if (((PardinusBounds) bounds).amalgamated() != null)
				assert ((PardinusBounds) bounds).amalgamated().resolved();
		}

		// [HASLab] if the bounds are for a decomposed problem, the bounds of the 
		// amalgamated problem should be considered when calculating symmetries.
		// [HASLab] the original bounds are used to set the relevant relations,
		// discarding irrelevant detected symmetries.
		// [HASLab] if configuration, these are the original bounds restricted to
		// the config vars; if integrated, these are the amalgamated bounds with
		// the config vars set to constant.
		// [HASLab] we can't simply use the stage bounds at the integrated stage
		// because the fixed configurations would affect the symmetries.
		stage_bounds = bounds;
		if (bounds instanceof PardinusBounds && ((PardinusBounds) bounds).amalgamated() != null) 
			bounds = ((PardinusBounds) bounds).amalgamated();
		
		this.reporter = reporter; // [HASLab] preserve reporter
		this.bounds = bounds; 
		this.usize = bounds.universe().size();
		reporter.detectingSymmetries(bounds);
		this.symmetries = SymmetryDetector.partition(bounds);
		reporter.detectedSymmetries(symmetries);
	}
	
	/**
	 * Breaks matrix symmetries on the relations in this.bounds that are constrained by  
	 * the total ordering and acyclic predicates, drawn from preds.values(), that make up the 
	 * keyset of the returned map.  After this method returns, the following constraint holds.
	 * Let m be the map returned by the method, and m.keySet() be the subset of preds.values() 
	 * used for symmetry breaking.  Then, if we let [[b]] denote the set of constraints 
	 * specified by a Bounds object b, the formulas "p and [[this.bounds]]" and "m.get(p) and [[this.bounds']]"
	 * are equisatisfiable for all p in m.keySet(). 
	 * 
	 * <p>The value of the "aggressive" flag determines how the symmetries are broken.  In particular, if
	 * the aggressive flag is true, then the symmetries are broken efficiently, at the cost of 
	 * losing the information needed to determine whether a predicate in m.keySet() belongs to an unsatisfiable 
	 * core or not.  If the aggressive flag is false, then a less efficient algorithm is applied, which preserves
	 * the information necessary for unsatisfiable core extraction. </p>
	 *
	 * <p>The aggressive symmetry breaking algorithm works as follows.  Let t1...tn and c1...ck
	 * be the total ordering and acyclic predicates in m.keySet().  For each t in {t1...tn}, this.bounds
	 * is modified so that the bounds for t.first, t.last, t.ordered and t.relation are the following constants: 
	 * t.first is the first atom in the upper bound of t.ordered, t.last is the last atom in the upper bound of t.ordered, t.ordered's
	 * lower bound is changed to be equal to its upper bound, and t.relation imposes a total ordering on t.ordered 
	 * that corresponds to the ordering of the atoms in this.bounds.universe. Then, m is updated with a binding
	 * from t to the constant formula TRUE.  For each c in {c1...ck},  
	 * this.bounds is modified so that the upper bound for c.relation is a tupleset whose equivalent matrix 
	 * has FALSE in the entries on or below the main diagonal.  Then, m is updated with a binding from c to the 
	 * constant formula TRUE.</p>
	 * 
	 * <p>The lossless symmetry breaking algorithm works as follows. Let t1...tn and c1...ck be the total ordering
	 * and acyclic predicates in m.keySet(). For each t in {t1...tn}, three fresh relations are added to this.bounds--
	 * t_first, t_last, t_ordered, and t_order--and constrained as follows: t_first is the first atom
	 * in the upper bound of t.ordered, t_last is the last atom in the upper bound of t.ordered, t_ordered is 
	 * the upper bound of t.ordered, and t_order imposes a total ordering on t.ordered that corresponds to the
	 * ordering of the atoms in this.bounds.universe.  Then, m is updated with a binding from t to the formula
	 * "t.first = t_first and t.last = t_last and t.ordered = t_ordered and t.relation = t.order."  
	 * For each c in {c1...ck}, a fresh relation c_acyclic is added to this.bounds and constrained to be a constant 
	 * whose equivalent matrix has no entries on or below the main diagonal. The map m is then 
	 * updated with a binding from c to the constraint "c in c_acyclic".</p>
	 * 
	 * @ensures this.bounds' is modified as described above
	 * @ensures this.symmetries' is modified to no longer contain the partitions that made up the bounds of
	 * the relations on which symmetries have been broken
	 * @return a map m such that m.keySet() in preds.values(), and for all predicates p in m.keySet(), the formulas
	 * "p and [[this.bounds]]" and "m.get(p) and [[this.bounds']]" are equisatisfiable
	 */
	Map<RelationPredicate, Formula> breakMatrixSymmetries(Map<Name, Set<RelationPredicate>> preds, boolean aggressive) {
		final Set<RelationPredicate> totals = preds.get(TOTAL_ORDERING);
		final Set<RelationPredicate> acyclics = preds.get(ACYCLIC);
		final Map<RelationPredicate, Formula> broken = new IdentityHashMap<RelationPredicate, Formula>();
		
		for(RelationPredicate.TotalOrdering pred : sort(totals.toArray(new RelationPredicate.TotalOrdering[totals.size()]))) {
			Formula replacement = breakTotalOrder(pred,aggressive);
			if (replacement!=null)
				broken.put(pred, replacement);
		}
		
		for(RelationPredicate.Acyclic pred : sort(acyclics.toArray(new RelationPredicate.Acyclic[acyclics.size()]))) {
			Formula replacement = breakAcyclic(pred,aggressive);
			if (replacement!=null)
				broken.put(pred, replacement);
		}
		
		return broken;
	}
		
	/**
	 * Generates a lex leader symmetry breaking predicate for this.symmetries 
	 * (if any), using the specified leaf interpreter and options.symmetryBreaking.
	 * It also invokes options.reporter().generatingSBP() if a non-constant predicate
	 * is generated.
	 * @requires interpreter.relations in this.bounds.relations
	 * @ensures options.reporter().generatingSBP() if a non-constant predicate is generated.
	 * @return a symmetry breaking predicate for this.symmetries
	 */
	final BooleanValue generateSBP(LeafInterpreter interpreter, Options options) {
		final int predLength = options.symmetryBreaking();
		if (symmetries.isEmpty() || predLength==0) return BooleanConstant.TRUE;
		options.reporter().generatingSBP();
		
		final List<RelationParts> relParts = relParts();
		final BooleanFactory factory = interpreter.factory();
		final BooleanAccumulator sbp = BooleanAccumulator.treeGate(Operator.AND);
		final List<BooleanValue> original = new ArrayList<BooleanValue>(predLength);
		final List<BooleanValue> permuted = new ArrayList<BooleanValue>(predLength);

		// [HASLab] report lexes
		final List<Entry<Relation, Tuple>> _original = new ArrayList<Entry<Relation, Tuple>>(predLength);
		final List<Entry<Relation, Tuple>> _permuted = new ArrayList<Entry<Relation, Tuple>>(predLength);

		for(IntSet sym : symmetries) {
		
			IntIterator indeces = sym.iterator();
			for(int prevIndex = indeces.next(); indeces.hasNext(); ) {
				int curIndex = indeces.next();
				for(Iterator<RelationParts> rIter = relParts.iterator(); rIter.hasNext() && original.size() < predLength;) {
					
					RelationParts rparts = rIter.next();
					Relation r = rparts.relation;
					
					// [HASLab] ignore symmetries that are not considered relevant at this stage 
					// (should only occur on decomposed problems at the configuration stage).
					if (!stage_bounds.relations().contains(r))
						continue; 

					if (!rparts.representatives.contains(sym.min())) 
						continue;  // r does not range over sym
					
					// [HASLab]
					if (r.isSkolem() && options.temporal())
						continue;
					
					// [HASLab] configuration matrices have a set of variables assigned T.
					// when the process iterates over these, we may obtain variables that are
					// not in the original SBP order; eg, if originally we had [1,2] < [3,4],
					// and 3=2=T, we need to generate [F,T]<[T,F]; but since it will only
					// iterate over T values, it will first retrieve 2=T, leading to [T,F]<[F,T]
					// thus we must store the variables and then sort them
					SortedMap<Integer,AbstractMap.SimpleEntry<Entry<Integer, BooleanValue>, Entry<Integer, BooleanValue>>> aux;
					aux = new TreeMap<Integer,AbstractMap.SimpleEntry<Entry<Integer, BooleanValue>, Entry<Integer, BooleanValue>>>();

					BooleanMatrix m = interpreter.interpret(r);
					for(IndexedEntry<BooleanValue> entry : m) {
						int permIndex = permutation(r.arity(), entry.index(), prevIndex, curIndex);
						BooleanValue permValue = m.get(permIndex);
						// [HASLab] relParts() filters out every fixed relation at the
						// general problem, so any constant value will have arisen from
						// the fixed configuration.
						// [HASLab] the found T variable may be the "larger" var, at 
						// which case atSameIndex will fail, but we still need to process it.
						if (permIndex==entry.index() || (!(permValue instanceof BooleanConstant) && atSameIndex(original, permValue, permuted, entry.value())))
							continue;
						
						// [HASLab] we know that boolean constants only occur at
						// configuration matrices; otherwise behave as usual.
						if (!(permValue instanceof BooleanConstant)) {
							// [HASLab] report lexes
							_original.add(new AbstractMap.SimpleEntry<Relation, Tuple>(r, interpreter.universe().factory().tuple(r.arity(), entry.index())));
							_permuted.add(new AbstractMap.SimpleEntry<Relation, Tuple>(r, interpreter.universe().factory().tuple(r.arity(), permIndex)));
							original.add(entry.value());
							permuted.add(permValue);			
						} else {
							// [HASLab] if the values are equal, then it does not affect the lexer
							// [HASLab] store the values so that they can be ordered below
							if ((entry.value()) != (permValue)) {
								Entry<Integer, BooleanValue> e1 = new AbstractMap.SimpleEntry<Integer, BooleanValue>(entry.index(),entry.value());
								Entry<Integer, BooleanValue> e2 = new AbstractMap.SimpleEntry<Integer, BooleanValue>(permIndex,permValue);
								aux.put(entry.index()>permIndex?permIndex:entry.index(), new AbstractMap.SimpleEntry<Entry<Integer, BooleanValue>, Entry<Integer, BooleanValue>>(e1,e2));
							} 
						}
					}
					// [HASLab]??redo all this!!
					// [HASLab] TODO: optimize this: [T, ...] < [F, ...] = F, [F, ...] < [T, ...] = T
					for (Integer index : aux.keySet()) {
						Entry<Integer, BooleanValue> e1 = aux.get(index).getKey();
						Entry<Integer, BooleanValue> e2 = aux.get(index).getValue();
						
						if (e1.getKey() > e2.getKey() && !(e2.getValue() == BooleanConstant.TRUE)) {
							original.add(e2.getValue());
							permuted.add(e1.getValue());
							_original.add(null); // this will allows to identify F < T below
							_permuted.add(null);
						} else if (e1.getKey() < e2.getKey() && !(e1.getValue() == BooleanConstant.TRUE)) {
							original.add(e1.getValue());
							permuted.add(e2.getValue());
							_original.add(null); // this will allows to identify F < T below
							_permuted.add(null);
						} else {
							// [HASLab] this happens because I can't filter the fixed bounds from total orders
							// since the bounds are cloned at the translator and the TOTALORDER is lost for 
							// the integrated problem
						}

					}
				}
								
				// [HASLab] report lexes
				final List<Entry<Relation, Tuple>> _foriginal = new ArrayList<Entry<Relation, Tuple>>(_original.size());
				final List<Entry<Relation, Tuple>> _fpermuted = new ArrayList<Entry<Relation, Tuple>>(_original.size());
				for (int i = 0; i < _original.size(); i ++) {
					 // identify F < T and ignore remaineder
					if (_original.get(i) == null && _permuted.get(i) == null) break;
					_foriginal.add(_original.get(i));
					_fpermuted.add(_permuted.get(i));
				}
				reporter.reportLex(_foriginal,_fpermuted);
				
				reporter.debug("act: "+original.toString()+" < "+permuted.toString());
				sbp.add(leq(factory, original, permuted));
				original.clear();
				permuted.clear();
				_original.clear();
				_permuted.clear();
				prevIndex = curIndex;
			}
		}
		symmetries.clear(); // no symmetries left to break (this is conservative)
		
		return factory.accumulate(sbp);
	}
	
	/**
	 * Returns a list of RelationParts that map each non-constant r in this.bounds.relations to
	 * the representatives of the sets from this.symmetries contained in the upper bound of r.  
	 * The entries are sorted by relations' arities and names.
	 * @return a list of RelationParts that contains an entry for each non-constant r in this.bounds.relations and
	 * the representatives of sets from this.symmetries contained in the upper bound of r.
	 */
	private List<RelationParts> relParts() {
		final List<RelationParts> relParts = new ArrayList<RelationParts>(bounds.relations().size());
		for(Relation r: bounds.relations()) {		
			IntSet upper = bounds.upperBound(r).indexView();
			if (upper.size()==bounds.lowerBound(r).size()) continue; // skip constant relation
			IntSet reps = Ints.bestSet(usize);
			for(IntIterator tuples = upper.iterator(); tuples.hasNext(); ) {
				for(int tIndex = tuples.next(), i = r.arity(); i > 0; i--, tIndex /= usize) {
					for(IntSet symm : symmetries) {
						if (symm.contains(tIndex%usize)) {
							reps.add(symm.min());
							break;
						}
					}
				}
			}
			relParts.add(new RelationParts(r, reps));
		}
		final Comparator<RelationParts> cmp = new Comparator<RelationParts>() {
			public int compare(RelationParts o1, RelationParts o2) {
				// [HASLab] the order of the variable lexer may not change
				// from the config stage to the integrated stage, thus the
				// integrated variables must be kept at the end.
				if (isConfigStage(o1.relation) && !isConfigStage(o2.relation))
					return -1;
				else if (isConfigStage(o2.relation) && !isConfigStage(o1.relation))
					return 1;
				final int acmp = o1.relation.arity() - o2.relation.arity();
				return acmp!=0 ? acmp : String.valueOf(o1.relation.name()).compareTo(String.valueOf(o2.relation.name()));
			}
		};
		Collections.sort(relParts, cmp);
		String s = "Sorted: "; // [HASLab]
		for (int i = 0; i < relParts.size(); i++)
			s+=relParts.get(i).relation;
		reporter.debug(s);
			
		return relParts;
	}
	
	/**
	 * Checks whether a relation belongs to the first stage of a decomposed problem.
	 * At the config stage, it suffices to check the stage bounds; at the integrated
	 * stage we need to check if the relation is fixed at the stage bounds. Note that
	 * relations that are fixed in the general bounds are already filtered by relParts.
	 * 
	 * @param stage_bounds
	 * @param r
	 * @return
	 */
	// [HASLab]
	private boolean isConfigStage(Relation r) {
		if ((stage_bounds instanceof PardinusBounds) && (((PardinusBounds) stage_bounds).integrated()))
			return stage_bounds.relations().contains(r)
					&& stage_bounds.lowerBound(r).size() == stage_bounds.upperBound(r).size();
		else
			return stage_bounds.relations().contains(r);
	}
	
	/**
	 * Returns a BooleanValue that is true iff the string of bits
	 * represented by l0 is lexicographically less than or equal
	 * to the string of bits reprented by l1.
	 * @requires l0.size()==l1.size()
	 * @return a circuit that compares l0 and l1
	 */
	private static final BooleanValue leq(BooleanFactory f, List<BooleanValue> l0, List<BooleanValue> l1) {
		final BooleanAccumulator cmp = BooleanAccumulator.treeGate(Operator.AND);
		BooleanValue prevEquals = BooleanConstant.TRUE;
		for(int i = 0; i < l0.size(); i++) {
			cmp.add(f.implies(prevEquals, f.implies(l0.get(i), l1.get(i))));
			prevEquals = f.and(prevEquals, f.iff(l0.get(i), l1.get(i)));
		}
		return f.accumulate(cmp);
	}
	
	/**
	 * Let t be the tuple represent by the given arity and tupleIndex.
	 * This method returns the tuple index of the tuple t' such t'
	 * is equal to t with each occurence of atomIndex0
	 * replaced by atomIndex1 and vice versa.
	 * @return the index of the tuple to which the given symmetry
	 * maps the tuple specified by arith and tupleIndex
	 */
	private final int permutation(int arity, int tupleIndex, int atomIndex0, int atomIndex1) {
		int permIndex = 0;
		for(int u = 1; arity > 0; arity--, tupleIndex /= usize, u *= usize ) {
			int atomIndex = tupleIndex%usize;
			if (atomIndex==atomIndex0)
				permIndex += atomIndex1 * u;
			else if (atomIndex==atomIndex1) {
				permIndex += atomIndex0 * u;
			} else {
				permIndex += atomIndex * u;
			}
		}
		return permIndex;
	}
	
	/**
	 * Returns true if there is some index i such that l0[i] = v0 and l1[i] = v1.
	 * @requires l0.size()=l1.size()
	 * @return some i: int | l0[i] = v0 && l1[i] = v1
	 */
	private static boolean atSameIndex(List<BooleanValue> l0, BooleanValue v0, List<BooleanValue> l1, BooleanValue v1) {
		for(int i = 0; i < l0.size(); i++) {
			if (l0.get(i).equals(v0) && l1.get(i).equals(v1))
				return true;
		}
		return false;
	}
	
	/**
	 * Sorts the predicates in the given array in the ascending order of 
	 * the names of the predicates' relations, and returns it.
	 * @return broken'
	 * @ensures all i: [0..preds.size()) | all j: [0..i) | 
	 *            broken[j].relation.name <= broken[i].relation.name 
	 */
	private static final <P extends RelationPredicate> P[] sort(final P[] preds) {
		final Comparator<RelationPredicate> cmp = new Comparator<RelationPredicate>() {
			public int compare(RelationPredicate o1, RelationPredicate o2) {
				return String.valueOf(o1.relation().name()).compareTo(String.valueOf(o2.relation().name()));
			}
		};
		Arrays.sort(preds, cmp);
		return preds;
	}	
	
	/**
	 * If possible, breaks symmetry on the given acyclic predicate and returns a formula
	 * f such that the meaning of acyclic with respect to this.bounds is equivalent to the
	 * meaning of f with respect to this.bounds'. If symmetry cannot be broken on the given predicate, returns null.  
	 * 
	 * <p>We break symmetry on the relation constrained by the given predicate iff 
	 * this.bounds.upperBound[acyclic.relation] is the cross product of some partition in this.symmetries with
	 * itself. Assuming that this is the case, we then break symmetry on acyclic.relation using one of the methods
	 * described in {@linkplain #breakMatrixSymmetries(Map, boolean)}; the method used depends
	 * on the value of the "agressive" flag.
	 * The partition that formed the upper bound of acylic.relation is removed from this.symmetries.</p>
	 * 
	 * @return null if symmetry cannot be broken on acyclic; otherwise returns a formula
	 * f such that the meaning of acyclic with respect to this.bounds is equivalent to the
	 * meaning of f with respect to this.bounds' 
	 * @ensures this.symmetries and this.bounds are modified as described in {@linkplain #breakMatrixSymmetries(Map, boolean)} iff this.bounds.upperBound[acyclic.relation] is the 
	 * cross product of some partition in this.symmetries with itself
	 * 
	 * @see #breakMatrixSymmetries(Map,boolean)
	 */
	private final Formula breakAcyclic(RelationPredicate.Acyclic acyclic, boolean aggressive) {
		final IntSet[] colParts = symmetricColumnPartitions(acyclic.relation());
		if (colParts!=null) {
			final Relation relation = acyclic.relation();
			final IntSet upper = bounds.upperBound(relation).indexView();
			final IntSet reduced = Ints.bestSet(usize*usize);
			for(IntIterator tuples = upper.iterator(); tuples.hasNext(); ) {
				int tuple = tuples.next();
				int mirror = (tuple / usize) + (tuple % usize)*usize;
				if (tuple != mirror) {
					if (!upper.contains(mirror)) return null;
					if (!reduced.contains(mirror))
						reduced.add(tuple);	
				}
			}
			
			// remove the partition from the set of symmetric partitions
			removePartition(colParts[0].min());
			
			if (aggressive) {
				bounds.bound(relation, bounds.universe().factory().setOf(2, reduced));
				// [HASLab] in decomposed problems, stage bounds are those that will
				// be effectively solved; for normal problems, stage bounds = bounds.
				if (stage_bounds instanceof PardinusBounds) 
					stage_bounds.bound(relation, bounds.universe().factory().setOf(2, reduced));

				return Formula.TRUE;
			} else {
				final Relation acyclicConst = Relation.binary("SYM_BREAK_CONST_"+acyclic.relation().name());
				bounds.boundExactly(acyclicConst, bounds.universe().factory().setOf(2, reduced));
				// [HASLab] in decomposed problems, stage bounds are those that will
				// be effectively solved; for normal problems, stage bounds = bounds.
				if (stage_bounds instanceof PardinusBounds) 
					stage_bounds.boundExactly(acyclicConst, bounds.universe().factory().setOf(2, reduced));
				
				return relation.in(acyclicConst);
			}
		}
		return null;
	}
	
	/**
	 * If possible, breaks symmetry on the given total ordering predicate and returns a formula
	 * f such that the meaning of total with respect to this.bounds is equivalent to the
	 * meaning of f with respect to this.bounds'. If symmetry cannot be broken on the given predicate, returns null.  
	 * 
	 * <p>We break symmetry on the relation constrained by the given predicate iff 
	 * total.first, total.last, and total.ordered have the same upper bound, which, when 
	 * cross-multiplied with itself gives the upper bound of total.relation. Assuming that this is the case, 
	 * we then break symmetry on total.relation, total.first, total.last, and total.ordered using one of the methods
	 * described in {@linkplain #breakMatrixSymmetries(Map, boolean)}; the method used depends
	 * on the value of the "agressive" flag.
	 * The partition that formed the upper bound of total.ordered is removed from this.symmetries.</p>
	 * 
	 * @return null if symmetry cannot be broken on total; otherwise returns a formula
	 * f such that the meaning of total with respect to this.bounds is equivalent to the
	 * meaning of f with respect to this.bounds' 
	 * @ensures this.symmetries and this.bounds are modified as desribed in {@linkplain #breakMatrixSymmetries(Map, boolean)} 
	 * iff total.first, total.last, and total.ordered have the same upper bound, which, when 
	 * cross-multiplied with itself gives the upper bound of total.relation
	 * 
	 * @see #breakMatrixSymmetries(Map,boolean)
	 */
	private final Formula breakTotalOrder(RelationPredicate.TotalOrdering total, boolean aggressive) {
		final Relation first = total.first(), last = total.last(), ordered = total.ordered(), relation = total.relation();
		final IntSet domain = bounds.upperBound(ordered).indexView();		

		// [HASLab] explorer, this avoids breaking the symmetry on total order relations whose bounds are not symmetric
		// however, when exploring, these are already fixed from the fixed prefix and would not be identified as so
		if (symmetricColumnPartitions(ordered)!=null && 
			bounds.upperBound(first).indexView().contains(domain.min()) && 
			bounds.upperBound(last).indexView().contains(domain.max())) {
			
			// construct the natural ordering that corresponds to the ordering of the atoms in the universe
			final IntSet ordering = Ints.bestSet(usize*usize);
			int prev = domain.min();
			for(IntIterator atoms = domain.iterator(prev+1, usize); atoms.hasNext(); ) {
				int next = atoms.next();
				ordering.add(prev*usize + next);
				prev = next;
			}
			
			if (ordering.containsAll(bounds.lowerBound(relation).indexView()) &&
				bounds.upperBound(relation).indexView().containsAll(ordering)) {
				
				// remove the ordered partition from the set of symmetric partitions
				removePartition(domain.min());
				
				final TupleFactory f = bounds.universe().factory();
				
				if (aggressive) {
					bounds.boundExactly(first, f.setOf(f.tuple(1, domain.min())));
					bounds.boundExactly(last, f.setOf(f.tuple(1, domain.max())));
					bounds.boundExactly(ordered, bounds.upperBound(total.ordered()));
					bounds.boundExactly(relation, f.setOf(2, ordering));
					// [HASLab] in decomposed problems, stage bounds are those that will
					// be effectively solved; for normal problems, stage bounds = bounds.
					if (stage_bounds != bounds) {
						// [HASLab] it the total order does not occur in this stage, ignore
						if (stage_bounds.lowerBound(ordered)!=null) {
							// [HASLab] if the ordering bounds do not fit in the stage bounds 
							// but did on amalgamated (tested above), then this was due to the 
							// integration, and thus must guarantee that will be unsat
							if ((!ordering.containsAll(stage_bounds.lowerBound(relation).indexView()) || 
									!stage_bounds.upperBound(relation).indexView().containsAll(ordering))) {
								stage_bounds.boundExactly(first, f.noneOf(1));
								stage_bounds.boundExactly(last, f.noneOf(1));
								stage_bounds.boundExactly(ordered, f.noneOf(1));
								stage_bounds.boundExactly(relation, f.noneOf(2));
								return null;
							}
							stage_bounds.boundExactly(first, f.setOf(f.tuple(1, domain.min())));
							stage_bounds.boundExactly(last, f.setOf(f.tuple(1, domain.max())));
							stage_bounds.boundExactly(ordered, bounds.upperBound(total.ordered()));
							stage_bounds.boundExactly(relation, f.setOf(2, ordering));
						}
					}
					return Formula.TRUE;
				} else {
					final Relation firstConst = Relation.unary("SYM_BREAK_CONST_"+first.name());
					final Relation lastConst = Relation.unary("SYM_BREAK_CONST_"+last.name());
					final Relation ordConst = Relation.unary("SYM_BREAK_CONST_"+ordered.name());
					final Relation relConst = Relation.binary("SYM_BREAK_CONST_"+relation.name());
					bounds.boundExactly(firstConst, f.setOf(f.tuple(1, domain.min())));
					bounds.boundExactly(lastConst, f.setOf(f.tuple(1, domain.max())));
					bounds.boundExactly(ordConst, bounds.upperBound(total.ordered()));
					bounds.boundExactly(relConst, f.setOf(2, ordering));
					// [HASLab] in decomposed problems, stage bounds are those that will
					// be effectively solved; for normal problems, stage bounds = bounds.
					if (stage_bounds != bounds) {
						// [HASLab] it the total order does not occur in this stage, ignore
						if (stage_bounds.lowerBound(ordered)!=null) {
							// [HASLab] if the ordering bounds do not fit in the stage bounds 
							// but did on amalgamated (tested above), then this was due to the 
							// integration, and thus must guarantee that will be unsat
							if ((!ordering.containsAll(stage_bounds.lowerBound(relation).indexView()) || 
									!stage_bounds.upperBound(relation).indexView().containsAll(ordering))) {
								stage_bounds.boundExactly(firstConst, f.noneOf(1));
								stage_bounds.boundExactly(lastConst, f.noneOf(1));
								stage_bounds.boundExactly(ordConst, f.noneOf(1));
								stage_bounds.boundExactly(relConst, f.noneOf(2));
								return null;
							}
							stage_bounds.boundExactly(firstConst, f.setOf(f.tuple(1, domain.min())));
							stage_bounds.boundExactly(lastConst, f.setOf(f.tuple(1, domain.max())));
							stage_bounds.boundExactly(ordConst, bounds.upperBound(total.ordered()));
							stage_bounds.boundExactly(relConst, f.setOf(2, ordering));
						}
					}
					return Formula.and(first.eq(firstConst), last.eq(lastConst), ordered.eq(ordConst), relation.eq(relConst));
				}

			}
		}
		
		return null;
	}

	/**
	 * Removes from this.symmetries the partition that contains the specified atom.
	 * @ensures this.symmetries' = { s: this.symmetries | !s.contains(atom) }
	 */
	private final void removePartition(int atom) {
		for(Iterator<IntSet> symIter = symmetries.iterator(); symIter.hasNext(); ) {
			if (symIter.next().contains(atom)) {
				symIter.remove();
				break;
			}			
		}
	}
	
	/**
	 * If all columns of the upper bound of r are symmetric partitions, 
	 * those partitions are returned.  Otherwise null is returned.
	 * @return (all i: [0..r.arity) | some s: symmetries[int] |
	 *          bounds.upperBound[r].project(i).indexView() = s) =>
	 *         {colParts: [0..r.arity)->IntSet | 
	 *          all i: [0..r.arity()) | colParts[i] = bounds.upperBound[r].project(i).indexView() },
	 *         null
	 */
	private final IntSet[] symmetricColumnPartitions(Relation r) {
		final IntSet upper = bounds.upperBound(r).indexView();
		if (upper.isEmpty()) return null;
		
		final IntSet[] colParts = new IntSet[r.arity()];
		for(int i = r.arity()-1, min = upper.min(); i >= 0; i--, min /= usize) {
			for(IntSet part : symmetries) {
				if (part.contains(min%usize)) {
					colParts[i] = part; 
					break;
				}
			}
			if (colParts[i]==null) 
				return null;
		}
		for(IntIterator tuples = upper.iterator(); tuples.hasNext(); ) {
			for(int i = r.arity()-1, tuple = tuples.next(); i >= 0; i--, tuple /= usize) {
				if (!colParts[i].contains(tuple%usize))
					return null;
			}		
		}
		return colParts;	
	}
	
	/**
	 * An entry for a relation and the representative (least atom) for each
	 * symmetry class in the relation's upper bound.
	 */
	private static final class RelationParts {
		final Relation relation;
		final IntSet representatives;
		
		RelationParts(Relation relation, IntSet representatives) {
			this.relation = relation;
			this.representatives = representatives;
		}
	}
}