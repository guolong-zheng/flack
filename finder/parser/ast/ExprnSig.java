package parser.ast;

import utility.StringUtil;
import edu.mit.csail.sdg.alloy4compiler.ast.Sig;
import parser.visitor.GenericVisitor;
import parser.visitor.VoidVisitor;

import java.util.Map;

public class ExprnSig extends Exprn {

    String name;

    public ExprnSig(Node parent, Sig expr) {
        super(parent, expr);
        this.name = StringUtil.removeThis(expr.label);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        toString(sb);
        return sb.toString();
    }

    @Override
    public String getInstantiatedString(Map<String, String> name2val) {
        if( name2val.get(name) != null) {
            return name2val.get(name);
        }
        return name;
    }

    public void toString(StringBuilder sb ){
        sb.append(name);
    }

    @Override
    public <R, V> R accept(GenericVisitor<R, V> visitor, V arg) {
        return visitor.visit(this, arg);
    }

    @Override
    public void accept(VoidVisitor visitor) {
        visitor.visit(this);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
