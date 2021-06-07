package parser.visitor;

import parser.ast.*;
import utility.AlloyUtil;
import utility.StringUtil;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/*
* collect relation names from AST, only visit pred in predNames, use SliceVisitor to get those names
* */
public class WordsCollector implements GenericVisitor<Set<String>, Map<String, Exprn>> {

    Set<String> predNames;

    public Map<Exprn, Set<String>> node2keyword;

    Boolean atomic;

    public WordsCollector(Set<String> predNames) {
        this.predNames = predNames;
        this.node2keyword = new HashMap<>();
        atomic = true;
    }

    @Override
    public Set<String> visit(AModel model, Map<String, Exprn> arg) {
        model.getFacts().stream().forEach(fact -> fact.accept(this, arg));

        model.getPredicates().stream().filter(pred -> this.predNames.contains(pred.getName())).forEach(predicate ->
                predicate.accept(this, arg)
        );

        model.getFunctions().stream().filter(func -> this.predNames.contains(func.getName())).forEach(predicate ->
                predicate.accept(this, arg)
        );

        return null;
    }

    @Override
    public Set<String> visit(Assert asserts, Map<String, Exprn> arg) {
        return null;
    }

    @Override
    public Set<String> visit(Opens open, Map<String, Exprn> arg) {
        return null;
    }

    @Override
    public Set<String> visit(SigDef sigDef, Map<String, Exprn> arg) {
        return null;
    }

    @Override
    public Set<String> visit(DeclField decl, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        decl.getNames().forEach(name -> {
            if (arg != null)
                // collect binding info
                ((Map<String, Exprn>) arg).put(name.toString(), decl.getExpr());
            res.addAll((Set) name.accept(this, arg));
        });
        res.addAll((Set) decl.getExpr().accept(this, arg));
        
        return res;
    }

    @Override
    public Set<String> visit(DeclParam decl, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        decl.getNames().forEach(name ->
        {
            if (arg != null)
                // collect binding info
                ((Map<String, Exprn>) arg).put(name.toString(), decl.getExpr());
            res.addAll((Set) name.accept(this, arg));
        });
        res.addAll((Set) decl.getExpr().accept(this, arg));
        
        return res;
    }

    @Override
    public Set<String> visit(DeclVar decl, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        decl.getNames().forEach(name -> {
            if (arg != null) {
                // collect binding info
                ((Map<String, Exprn>) arg).put(name.toString(), decl.getExpr());
            }
            res.addAll((Set) name.accept(this, arg));
        });
        res.addAll((Set) decl.getExpr().accept(this, arg));
        
        return res;
    }

    @Override
    public Set<String> visit(Fact fact, Map<String, Exprn> arg) {
        //fact.getExpr().accept(this, arg);
        fact.getExpr().accept(this, new HashMap<String, Exprn>());
        
        return null;
    }

    @Override
    public Set<String> visit(Predicate pred, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        Map<String, Exprn> var2expr;
        if( arg == null)
            var2expr = new HashMap<>();
        else
            var2expr = new HashMap<>((Map)arg);
        pred.getParams().forEach(declParam -> res.addAll((Set) declParam.accept(this, var2expr)));
        res.addAll((Set) pred.getBody().accept(this, var2expr));
        
        return res;
    }

    @Override
    public Set<String> visit(Function func, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        Map<String, Exprn> var2expr;
        if( arg == null)
            var2expr = new HashMap<>();
        else
            var2expr = new HashMap<>((Map)arg);

        func.getParams().forEach(param -> {
            param.accept(this, var2expr);});
        res.addAll((Set) func.getBody().accept(this, var2expr));
        func.getReturnExpr().accept(this, var2expr);
        
        return res;
    }

    @Override
    public Set<String> visit(ExprnBinaryBool expr, Map<String, Exprn> arg) {
        boolean changed = false;
        if(atomic) {
            atomic = false;
            changed = true;
        }
        Set<String> words = new HashSet<>();
        Exprn left = expr.getLeft();
        Exprn right = expr.getRight();
        words.addAll((Set<String>) left.accept(this, arg));
        words.addAll((Set<String>) right.accept(this, arg));
        if(changed){
            atomic = true;
            node2keyword.put(expr, words);
        }
        
        return words;
    }

    @Override
    public Set<String> visit(ExprnBinaryRel expr, Map<String, Exprn> arg) {
        boolean changed = false;
        if(atomic) {
            atomic = false;
            changed = true;
        }
        Set<String> words = new HashSet<>();
        Exprn left = expr.getLeft();
        Exprn right = expr.getRight();
        Set<String> leftres = left.accept(this, arg);
        Set<String> rightres = right.accept(this, arg);
        words.addAll((Set<String>) left.accept(this, arg));
        words.addAll((Set<String>) right.accept(this, arg));
        // TODO: extract relations connected by .
        switch(expr.getOp()){
            case JOIN:
                String leftstr = AlloyUtil.getStringByExprType(left, leftres);
                String rightstr = AlloyUtil.getStringByExprType(right, rightres);
                words.add(leftstr + "." + rightstr);
            default:
                break;
        }
        if(changed){
            atomic = true;
            node2keyword.put(expr, words);
        }
        
       // node2keyword.put(expr, words);
        return words;
    }

    @Override
    public Set<String> visit(ExprnCallBool expr, Map<String, Exprn> arg) {
        expr.getArgs().forEach(var -> var.accept(this, arg));
        String fname = StringUtil.removeThis(expr.getName());
        Predicate pred = (Predicate) expr.getNodeMap().findFunc(fname);
        if( pred == null ) {
            Set<String> res = new HashSet<>();
            expr.getArgs().forEach( args -> res.addAll(args.accept(this, arg)));
            return res;
        }else
            return pred.accept(this, arg);
    }

    @Override
    public Set<String> visit(ExprnCallRel expr, Map<String, Exprn> arg) {
        expr.getArgs().forEach(var -> var.accept(this, arg));
        String fname = StringUtil.removeThis(expr.getName());
        if (fname.startsWith("integer")) {
            return new HashSet<>();
        }
        Function fun = (Function) expr.getNodeMap().findFunc(fname);
        
        return fun.accept(this, arg);
    }

    @Override
    public Set<String> visit(ExprnConst expr, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        res.add(expr.getOp().toString());
            
        return res;
    }

    @Override
    public Set<String> visit(ExprnField expr, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        res.add(expr.getName());
        return res;
    }

    @Override
    public Set<String> visit(ExprnITEBool expr, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        res.addAll((Set) expr.getCondition().accept(this, arg));
        res.addAll((Set) expr.getThenClause().accept(this, arg));
        res.addAll((Set) expr.getElseClause().accept(this, arg));

        return res;
    }

    @Override
    public Set<String> visit(ExprnITERel expr, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        res.addAll((Set) expr.getCondition().accept(this, arg));
        res.addAll((Set) expr.getThenClause().accept(this, arg));
        res.addAll((Set) expr.getElseClause().accept(this, arg));
        
        return res;
    }

    @Override
    public Set<String> visit(ExprnLet expr, Map<String, Exprn> arg) {
        if( arg == null)
            arg = new HashMap<>();
        Set<String> res = new HashSet<>();
        arg.put(expr.getVar().getName(), expr.getExpr());
        res.addAll( expr.getVar().accept(this, arg) );
        res.addAll( expr.getExpr().accept(this, arg) );
        res.addAll( expr.getSub().accept(this, arg) );
        
        return res;
    }

    @Override
    public Set<String> visit(ExprnListBool expr, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        expr.getArgs().forEach(ag -> {
            res.addAll((Set) ag.accept(this, arg));
        });
        if(expr.op == ExprnListBool.Op.OR)
            node2keyword.put(expr, res);
        return res;
    }

    @Override
    public Set<String> visit(ExprnListRel expr, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        expr.getArgs().forEach(ag -> {
            res.addAll((Set) ag.accept(this, arg));
        });
        
        return res;
    }

    @Override
    public Set<String> visit(ExprnQtBool expr, Map<String, Exprn> arg) {
        boolean changed = false;
        if(atomic) {
            atomic = false;
            changed = true;
        }
        Set<String> res = new HashSet<>();
        // when decl a var, collect the expr it binds to
        Map<String, Exprn> var2expr;
        if( arg == null)
            var2expr = new HashMap<>();
        else
            var2expr = new HashMap<>((Map)arg);
        expr.getVars().forEach(var -> {
            res.addAll((Set) var.accept(this, var2expr));
        });
        res.addAll((Set) expr.getSub().accept(this, var2expr));
        if(changed){
            atomic = true;
            node2keyword.put(expr, res);
        }
        
        return res;
    }

    @Override
    public Set<String> visit(ExprnQtRel expr, Map<String, Exprn> arg) {
        boolean changed = false;
        if(atomic) {
            atomic = false;
            changed = true;
        }
        Set<String> res = new HashSet<>();
        // when decl a var, collect the expr it binds to
        Map<String, Exprn> var2expr;
        if( arg == null)
            var2expr = new HashMap<>();
        else
            var2expr = new HashMap<>((Map)arg);
        expr.getVars().forEach(var -> {
            res.addAll((Set) var.accept(this, var2expr));
        });
        //expr.getVars().forEach(var -> res.addAll((Set)var.accept(this, arg)));
        res.addAll((Set) expr.getSub().accept(this, var2expr));
        if(changed){
            atomic = true;
            node2keyword.put(expr, res);
        }
        
       // node2keyword.put(expr, res);
        return res;
    }


    @Override
    public Set<String> visit(ExprnSig expr, Map<String, Exprn> arg) {
        // ask
        Set<String> res = new HashSet<>();
        res.add(expr.getName());
        // node2keywrod.put(expr, res);  // no need to add single var
        
        return res;
    }

    @Override
    public Set<String> visit(ExprnVar expr, Map<String, Exprn> arg) {
        if(arg != null)
            expr.setBindExpr( ((Map<String, Exprn>)arg).get(expr.toString()) );
        Set<String> res = new HashSet<>();
        String type = expr.getType().toString();
        type = StringUtil.trimTypeStr(type);
        // TODO: not sure if adding like this is ok, when expr is a relation, add it relation name, its type would be like a->b and hard to map; otherwise add its sig(type) name

        res.addAll( arg.get(expr.toString()).accept(this, arg) );

        if(expr.getType().arity() > 1)
            res.add(expr.toString());
        else
            res.add(type);
        
        //res.add(type);
        //res.add(expr.toString());
        // node2keywrod.put(expr, res);  //no need to add single var
        return res;
    }

    /*
    * TODO
    * */
    @Override
    public Set<String> visit(ExprnUnaryBool expr, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        Exprn sub = expr.getSub();
        res.addAll((Set) sub.accept(this, arg));
        // TODO: added later
        //node2keyword.put(expr, res);
        return res;
    }

    /*
    * TODO
    * */
    @Override
    public Set<String> visit(ExprnUnaryRel expr, Map<String, Exprn> arg) {
        Set<String> res = new HashSet<>();
        Exprn sub = expr.getSub();
        res.addAll((Set) sub.accept(this, arg));
        //node2keyword.put(expr, res);
        if(expr.op != ExprnUnaryRel.Op.NOOP){
            
        }
        return res;
    }
}
