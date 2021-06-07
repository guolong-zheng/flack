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
package kodkod.engine;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import kodkod.ast.Expression;
import kodkod.ast.Formula;
import kodkod.ast.Relation;
import kodkod.engine.config.ExtendedOptions;
import kodkod.engine.config.Options;
import kodkod.engine.config.Reporter;
import kodkod.engine.satlab.ExternalSolver;
import kodkod.engine.unbounded.ElectrodPrinter;
import kodkod.engine.unbounded.ElectrodReader;
import kodkod.engine.unbounded.InvalidUnboundedProblem;
import kodkod.engine.unbounded.InvalidUnboundedSolution;
import kodkod.instance.PardinusBounds;
import kodkod.instance.TemporalInstance;

/**
 * A computational engine for solving unbounded temporal relational
 * satisfiability problems. Such a problem is described by a
 * {@link kodkod.ast.Formula formula} in first order temporal relational logic;
 * finite unbounded temporal {@link PardinusBounds bounds} on the value of each
 * {@link Relation relation} constrained by the respective formula; and a set of
 * {@link ExtendedOptions options}, although there are currently no particular
 * options for unbounded temporal solving.
 * 
 * <p>
 * An {@link ElectrodSolver} takes as input a relational problem and produces a
 * satisfying model or a {@link TemporalInstance temporal instance} of it, if
 * one exists.
 * </p>
 * 
 * <p>
 * Iteration over Electrod is implemented through the "formulation" of the
 * previous temporal instance, introducing its negation into the formula, and
 * restarting the solver.
 * </p>
 * 
 * @author Nuno Macedo // [HASLab] unbounded temporal model finding
 */
public class ElectrodSolver implements UnboundedSolver<ExtendedOptions>,
		TemporalSolver<ExtendedOptions>,
		IterableSolver<PardinusBounds, ExtendedOptions> {

	private final ExtendedOptions options;

	/**
	 * Constructs a new Electrod solver with the given options.
	 * 
	 * @param options the solver options.
	 * @throws NullPointerException
	 *             options = null
	 */
	public ElectrodSolver(ExtendedOptions options) {
		if (options == null)
			throw new NullPointerException();
		this.options = options;
	}

	/**
	 * {@inheritDoc}
	 */
	public ExtendedOptions options() {
		return options;
	}

	/**
	 * {@inheritDoc}
	 */
	public Solution solve(Formula formula, PardinusBounds bounds)
			throws InvalidUnboundedProblem, InvalidUnboundedSolution {
		return ElectrodSolver.go(formula,bounds,options);
	}

	/**
	 * {@inheritDoc}
	 */
	public Iterator<Solution> solveAll(Formula formula, PardinusBounds bounds) {
		return new SolutionIterator(formula, bounds, options);
	}

	private final static class SolutionIterator implements Iterator<Solution> {
	
		private Formula formula;
		private final PardinusBounds bounds;
		private Map<Object,Expression> reifs;
		private ExtendedOptions options;
		
		SolutionIterator(Formula formula, PardinusBounds bounds, ExtendedOptions options) { // [HASLab]
			this.formula = formula;
			this.reifs = new HashMap<Object,Expression>();
			this.bounds = bounds;
			this.options = options;
		}
			
		@Override
		public boolean hasNext() {
			return formula != null;
		}
	
		@Override
		public Solution next() {
				
			Solution s = go(formula,bounds,options);
	
			if (s.sat()) {
				Formula trns = s.instance().formulate(bounds,reifs,formula).not();
				options.reporter().debug("Reified instance: "+trns);
				formula = formula.and(trns);
			}
			else 
				formula = null;
	
			return s;
		}
	
	}

	/**
	 * Effectively launches an Electrod process. Used at single solve and at
	 * iteration, since the process is restarted.
	 * 
	 * @param formula
	 * @param bounds
	 * @param options
	 * @return a solution to the problem
	 */
	private static Solution go(Formula formula, PardinusBounds bounds, ExtendedOptions options) {
		Reporter rep = options.reporter();
		
		// if not decomposed, use the amalgamated if any
		if (!options.decomposed() && bounds.amalgamated!=null)
			bounds = bounds.amalgamated();

		// create a directory with the specified unique name
		String temp=System.getProperty("java.io.tmpdir");
		File dir = new File(temp+File.separatorChar+options.uniqueName());
		if (!dir.exists()) dir.mkdir();
		
		String file = dir.toString()+File.separatorChar+String.format("%05d", bounds.integration);
		PrintWriter writer;
		try {
			if (!Options.isDebug())
				new File(file+".elo").deleteOnExit();
			writer = new PrintWriter(file+".elo");
			String electrod = ElectrodPrinter.print(formula, bounds, rep);
			writer.println(electrod);
			writer.close();
			rep.debug("New Electrod problem at "+dir+".");
		} catch (FileNotFoundException e) {
			throw new AbortedException("Electrod problem generation failed.", e);
		}
		ProcessBuilder builder;
		List<String> args = new ArrayList<String>();
		args.add(((ExternalSolver) options.solver().instance()).executable);
		args.addAll(Arrays.asList(((ExternalSolver) options.solver().instance()).options));
		args.add(Options.isDebug()?"-v":"--");
		args.add(file+".elo");
				
		builder = new ProcessBuilder(args);
		
		builder.environment().put("PATH", builder.environment().get("PATH")+":/usr/local/bin:.");
		builder.redirectErrorStream(true);
		int ret = -1;
		final Process p;
		try {
			options.reporter().solvingCNF(-1, -1, -1);

			p = builder.start();
			// stores the pid so that it can be correctly terminated
			Runtime.getRuntime().addShutdownHook(new Thread() {
				@Override
				public void run() {
					if (!System.getProperty("os.name").toLowerCase(Locale.US).startsWith("windows"))
						try {
							Field f = p.getClass().getDeclaredField("pid");
							f.setAccessible(true);
							Runtime.getRuntime().exec("kill -SIGTERM " + f.get(p));
						} catch (NoSuchFieldException | SecurityException | IllegalArgumentException
								| IllegalAccessException | IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					else
						p.destroy();
				}
			});
			
			try {
				BufferedReader output = new BufferedReader(new InputStreamReader(
						p.getInputStream()));

				String oline = "";
				while ((oline = output.readLine()) != null)
					rep.debug(oline);

				ret = p.waitFor();
			} catch (InterruptedException e) {
				p.destroy();
				throw new AbortedException("Electrod problem interrupted.", e);
			}
		} catch (IOException e1) {
			throw new AbortedException("Electrod problem failed.", e1);
		}
		
		if (ret != 0) {
			rep.warning("Electrod exit code: "+ret);
			throw new AbortedException("Electrod exit code: "+ret);
		}
		else
			rep.debug("Electrod ran successfully.");
		
		File xml = new File(file+".xml");
		
		if (!Options.isDebug())
			xml.deleteOnExit();

		if (!xml.exists())
			throw new AbortedException("XML solution file not found: "+file+".xml.");
		else {
			rep.debug(file);

			ElectrodReader rd = new ElectrodReader(bounds);
			TemporalInstance res = rd.read(xml);
			
			Statistics st = new Statistics(rd.nbvars, 0,0, rd.ctime, rd.atime);

			Solution sol;
			// ElectrodReader#read returns null if unsat
			if (res == null)
				sol = Solution.unsatisfiable(st, null);
			else
				sol = Solution.satisfiable(st, res);
			
			return sol;
		}
	}
	
	/**
	 * {@inheritDoc}
	 */
	public void free() {}

}
