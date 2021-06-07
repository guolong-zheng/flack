package parser.ast;

import edu.mit.csail.sdg.alloy4compiler.ast.ExprUnary;
import parser.visitor.GenericVisitor;
import parser.visitor.VoidVisitor;

import java.util.Map;

public class ExprnUnaryBool extends ExprnUnary {
    public Op op;

    public ExprnUnaryBool(Node parent, ExprUnary expr) {
        super(parent, expr);
        switch (expr.op) {
            case LONE:
                this.op = Op.LONE;
                break;
            case ONE:
                this.op = Op.ONE;
                break;
            case SOME:
                this.op = Op.SOME;
                break;
            case NO:
                this.op = Op.NO;
                break;
            case NOT:
                this.op = Op.NOT;
                break;
        }
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        toString(sb);
        return sb.toString();
    }

    public void toString(StringBuilder sb){
        sb.append(op);
        sb.append("(");
        sub.toString(sb);
        sb.append(")");
    }

    @Override
    public String getInstantiatedString(Map<String, String> name2val) {
        return op + "(" + sub.getInstantiatedString(name2val) + ")";
    }

    public static enum Op {
        LONE("lone"),
        ONE("one"),
        SOME("some"),
        NO("no"),
        NOT("!");

        private String label;

        private Op(String label) {
            this.label = label;
        }

        public String toString() {
            switch (this) {
                case NOT:
                    return label;
                default:
                    return label + " ";
            }
        }
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
