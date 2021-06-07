package parser.ast;

import edu.mit.csail.sdg.alloy4compiler.ast.ExprVar;
import parser.visitor.GenericVisitor;
import parser.visitor.VoidVisitor;
import utility.StringUtil;

import java.util.Map;

public class ExprnVar extends Exprn {

    String name;

    Exprn bindExpr;

    public ExprnVar(Node parent, ExprVar expr) {
        super(parent, expr);
        this.name = expr.label;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        toString(sb);
        return sb.toString();
    }

    @Override
    public String getInstantiatedString(Map<String, String> name2val) {
        Exprn exprn = this.bindExpr;
        // TOFIX: add for now
        String val = name2val.get(name);
        if(val != null){
            return val;
        }
        if( exprn == null )
            return name;
        if( exprn instanceof ExprnQtRel && ((ExprnQtRel) exprn).getOp() == ExprnQtRel.Op.COMPREHENSION){
            return exprn.getInstantiatedString(name2val);
        }
        if( exprn.toString().contains(".")){
            //String s = exprn.getInstantiatedString(name2val);
            String type = StringUtil.trimTypeStr(exprn.getType().toString());
            if(name2val.get(type) != null) {
                return name2val.get(type);
            }
        }
        /*
        if( exprn.getType().toString().contains("Int")){
            // TODO: need to fix
            return name2val.get("Int") == null ? "1" : name2val.get("Int");
        }
        */
       /* Set<String> res = new HashSet<>();
        // for decled vars, if it is decled to a binary expression, try to find if it is a skolem variable;
        // if so, use the skolem val for the return; else, use its binded express
        // for example:
        // all b : Book | all n : b.entry
        // skolem = {Book$0, Name$1}   Book$0.entry = {Name$0, Name$1}
        // n is binded to Book$0.entry which contains a common val to skolem, so n => {Name$1}
        String s = exprn.getInstantiatedString(name2val);
        System.out.println(s);
        if( s.contains(".")) {
                String sigName = StringUtil.trimTypeStr( exprn.getType().toString() );
                String skolemVal = name2val.get(sigName);
                return skolemVal;
        }
        */
        return exprn.getInstantiatedString(name2val);
    }

    public void setBindExpr(Exprn expr ) {
        this.bindExpr = expr;
    }

    public Exprn getBindExpr(){
        return this.bindExpr;
    }

    public void toString(StringBuilder sb){
        sb.append(this.name);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public <R, V> R accept(GenericVisitor<R, V> visitor, V arg) {
        return visitor.visit(this, arg);
    }

    @Override
    public void accept(VoidVisitor visitor) {
        visitor.visit(this);
    }
}
