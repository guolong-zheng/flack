package parser.ast;

import edu.mit.csail.sdg.alloy4compiler.ast.ExprUnary;

public abstract class ExprnUnary extends Exprn {
    Exprn sub;

    public ExprnUnary(Node parent, ExprUnary expr) {
        super(parent, expr);
        this.sub = Exprn.parseExpr(this, expr.sub);
    }

    public Exprn getSub() {
        return sub;
    }

    public void setSub(Exprn sub) {
        this.sub = sub;
    }
}
