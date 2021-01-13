package parser.ast;

import edu.mit.csail.sdg.alloy4compiler.ast.ExprLet;
import parser.visitor.GenericVisitor;
import parser.visitor.VoidVisitor;

import java.util.Map;

/* (let var = expr | sub) */
public class ExprnLet extends Exprn {

    ExprnVar var;

    Exprn expr;

    Exprn sub;

    public ExprnLet(Node parent, ExprLet expr) {
        super(parent, expr);
        this.var = (ExprnVar) Exprn.parseExpr(this, expr.var);
        this.expr = Exprn.parseExpr(this, expr.expr);
        this.sub = Exprn.parseExpr(this, expr.sub);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        toString(sb);
        return sb.toString();
    }

    public void toString(StringBuilder sb){
        sb.append("let ");
        var.toString(sb);
        sb.append(" = ");
        expr.toString(sb);
        sb.append(" | ");
        sub.toString(sb);
    }

    @Override
    public String getInstantiatedString(Map<String, String> name2val) {
        String v = var.getInstantiatedString(name2val);
        String e = expr.getInstantiatedString(name2val);
        String s = sub.getInstantiatedString(name2val);
        return "let " + v + " = " + e + " | " + s;
    }

    @Override
    public <R, V> R accept(GenericVisitor<R, V> visitor, V arg) {
        return visitor.visit(this, arg);
    }

    @Override
    public void accept(VoidVisitor visitor) {
        visitor.visit(this);
    }

    public ExprnVar getVar() {
        return var;
    }

    public void setVar(ExprnVar var) {
        this.var = var;
    }

    public Exprn getExpr() {
        return expr;
    }

    public void setExpr(Exprn expr) {
        this.expr = expr;
    }

    public Exprn getSub() {
        return sub;
    }

    public void setSub(Exprn sub) {
        this.sub = sub;
    }
}
