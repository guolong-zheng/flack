package parser.ast;

import edu.mit.csail.sdg.alloy4compiler.ast.ExprBinary;

public abstract class ExprnBinary extends Exprn {
    Exprn left;
    Exprn right;

    public ExprnBinary(Node parent, ExprBinary exprBinary) {
        super(parent, exprBinary);
        this.left = Exprn.parseExpr(this, exprBinary.left);
        this.right = Exprn.parseExpr(this, exprBinary.right);
    }

    public Exprn getLeft() {
        return left;
    }

    public void setLeft(Exprn left) {
        this.left = left;
    }

    public Exprn getRight() {
        return right;
    }

    public void setRight(Exprn right) {
        this.right = right;
    }
}
