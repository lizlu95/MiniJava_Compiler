package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.frame.x86_64.X86_64Frame;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.temp.Temp;
import ir.visitor.Visitor;

public class LABEL extends IRStm {
    public Label label;

    public LABEL(Label l) {
        label = l;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.print("LABEL ");
        out.print(label);
    }

    @Override
    public IRStm build(List<IRExp> kids) {
        return this;
    }

    @Override
    public List<IRExp> kids() {
        return List.empty();
    }

    public Label getLabel() {
        return label;
    }

    @Override
    public Label interp(X86_64SimFrame frame) {
        //Label's aren't real instructions. They don't *do* anything.
        return null;
    }

    @Override
    public List<Temp> use() {
        if (label.toString().contains("DONE_")) {
            return List.cons(X86_64Frame.RV, X86_64Frame.special.append(X86_64Frame.calleeSave));
        }
        return empty;
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

