package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.temp.Temp;
import ir.visitor.Visitor;

public class MOVE extends IRStm {
    public final IRExp dst;
    public final IRExp src;

    public MOVE(IRExp d, IRExp s) {
        dst = d;
        src = s;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println("MOVE(");
        out.indent();

        out.print(dst);
        out.println(" <-");
        out.print(src);

        out.outdent();
        out.print(")");
    }

    @Override
    public IRStm build(List<IRExp> kids) {
        if (dst instanceof MEM)
            return new MOVE(new MEM(kids.get(0)), kids.get(1));
        else
            return new MOVE(dst, kids.head());
    }

    @Override
    public List<IRExp> kids() {
        if (dst instanceof MEM)
            return List.list(((MEM) dst).exp, src);
        else
            return List.list(src);
    }

    @Override
    public Label interp(X86_64SimFrame env) {
        dst.set(src.interp(env), env);
        return null;
    }

    public boolean isMove() {
        return src instanceof TEMP && dst instanceof TEMP;
    }

    @Override
    public List<Temp> def() {
        if (dst instanceof TEMP) {
            TEMP tdst = (TEMP) dst;
            return List.list(tdst.temp);
        } else {
            return List.empty();
        }
    }

    @Override
    public boolean mentionsMemOrCall() {
        return src.mentionsMemOrCall() || dst.mentionsMemOrCall();
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

