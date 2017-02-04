package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.Int;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.visitor.Visitor;

public class CONST extends IRExp {
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + value;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        CONST other = (CONST) obj;
        if (value != other.value)
            return false;
        return true;
    }

    private int value;

    public CONST(int v) {
        value = v;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.print("CONST ");
        out.print(value);
    }

    @Override
    public IRExp build(List<IRExp> kids) {
        return this;
    }

    @Override
    public List<IRExp> kids() {
        return List.empty();
    }

    @Override
    public Word interp(X86_64SimFrame env) {
        return new Int(value);
    }

    public int getValue() {
        return value;
    }

    @Override
    public boolean isCONST(int i) {
        return i == value;
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

