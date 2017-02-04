package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.LabelPtr;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.visitor.Visitor;

public class JUMP extends IRStm {
    public IRExp exp;
    private List<Label> targets;

    public JUMP(IRExp e, List<Label> t) {
        exp = e;
        targets = t;
    }

    public JUMP(Label target) {
        this(new NAME(target), List.list(target));
    }

    @Override
    public void dump(IndentingWriter out) {
        out.print("JUMP(");
        out.print(exp);
        out.print(")");
    }

    @Override
    public List<IRExp> kids() {
        return List.list(getExp());
    }

    public IRExp getExp() {
        return exp;
    }

    @Override
    public IRStm build(List<IRExp> kids) {
        return new JUMP(kids.head(), targets);
    }

    @Override
    public Label interp(X86_64SimFrame env) {
        LabelPtr label = (LabelPtr) getExp().interp(env);
        return label.getLabel();
    }

    @Override
    public boolean isJump() {
        return true;
    }

    @Override
    public List<Label> getJumpTargets() {
        return targets;
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

