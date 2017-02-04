package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.visitor.Visitor;

public class SEQ extends IRStm {
    public final IRStm left;
    public final IRStm right;

    public SEQ(IRStm l, IRStm r) {
        left = l;
        right = r;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println("SEQ(");
        out.indent();

        out.print(left);
        out.println(", ");
        out.print(right);

        out.outdent();
        out.print(")");
    }

    @Override
    public IRStm build(List<IRExp> kids) {
        throw new Error("not applicable to SEQ");
    }

    @Override
    public List<IRExp> kids() {
        throw new Error("not applicable to SEQ");
    }

    @Override
    public Label interp(X86_64SimFrame env) {
        throw new Error("interp -- should only be called on atomic Stms \n " +
                "    -- Linearized IR should not have SEQ!");
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

