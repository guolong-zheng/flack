package parser.ast;

import utility.StringUtil;
import edu.mit.csail.sdg.alloy4compiler.ast.Sig;
import parser.visitor.GenericVisitor;
import parser.visitor.VoidVisitor;

import java.util.Map;

public class ExprnField extends Exprn {

    String name;

    public ExprnField(Node parent, Sig.Field field) {
        super(parent, field);
        this.name = StringUtil.removeThis( field.label );
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        toString(sb);
        return sb.toString();
    }

    public void toString(StringBuilder sb){
        sb.append(this.name);
    }

    @Override
    public String getInstantiatedString(Map<String, String> name2val) {
        return this.name;
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
