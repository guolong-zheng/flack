package parser.ast;

import edu.mit.csail.sdg.alloy4compiler.ast.ExprITE;

import java.util.Map;

public abstract class ExprnITE extends Exprn {

    Exprn condition;

    Exprn thenClause;

    Exprn elseClause;

    public ExprnITE(Node parent, ExprITE exprITE) {
        super(parent, exprITE);
        this.condition = Exprn.parseExpr(this, exprITE.cond);
        this.thenClause = Exprn.parseExpr(this, exprITE.left);
        this.elseClause = Exprn.parseExpr(this, exprITE.right);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        toString(sb);
        return "(" + sb.toString() + ")";
    }

    public void toString(StringBuilder sb){
        sb.append("(");
        condition.toString(sb);
        sb.append(" => ");
        thenClause.toString(sb);
        sb.append(" else ");
        elseClause.toString(sb);
        sb.append(")");
    }

    @Override
    public String getInstantiatedString(Map<String, String> name2val) {
        String cond = condition.getInstantiatedString(name2val);
        String then = thenClause.getInstantiatedString(name2val);
        String els = elseClause.getInstantiatedString(name2val);
        return  "(" + cond + " => " + then + " else " + els + ")";

    }

    public Exprn getCondition() {
        return condition;
    }

    public void setCondition(Exprn condition) {
        this.condition = condition;
    }

    public Exprn getThenClause() {
        return thenClause;
    }

    public void setThenClause(Exprn thenClause) {
        this.thenClause = thenClause;
    }

    public Exprn getElseClause() {
        return elseClause;
    }

    public void setElseClause(Exprn elseClause) {
        this.elseClause = elseClause;
    }
}
