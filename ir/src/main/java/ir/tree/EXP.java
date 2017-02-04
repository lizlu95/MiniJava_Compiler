package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.visitor.Visitor;

public class EXP extends IRStm {
    public final IRExp exp;

    public EXP(IRExp e) {
        exp = e;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.print("EXP(");
        out.print(exp);
        out.print(")");
    }

    @Override
    public IRStm build(List<IRExp> kids) {
        return IR.EXP(kids.get(0));
    }

    @Override
    public List<IRExp> kids() {
        return List.list(exp);
    }

    @Override
    public Label interp(X86_64SimFrame env) {
        exp.interp(env);
        return null;
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

