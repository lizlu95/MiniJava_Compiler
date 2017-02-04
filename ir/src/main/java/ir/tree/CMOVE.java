package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.temp.Temp;
import ir.tree.CJUMP.RelOp;
import ir.visitor.Visitor;

public class CMOVE extends IRStm {
    public RelOp relop;
    public IRExp left;
    public IRExp right;
    public final IRExp dst;
    public final IRExp src;

    public CMOVE(RelOp rel, IRExp l, IRExp r, IRExp d, IRExp s) {
        relop = rel;
        left = l;
        right = r;
        dst = d;
        src = s;
    }

    @Override
    public IRStm build(List<IRExp> kids) {
        if (dst instanceof MEM)
            return new CMOVE(relop, kids.get(0), kids.get(1), new MEM(kids.get(2)), kids.get(3));
        else
            return new CMOVE(relop, kids.get(0), kids.get(1), dst, kids.get(2));
    }

    @Override
    public void dump(IndentingWriter out) {
        out.print("CMOVE(");
        out.print(relop);
        out.println(",");
        out.indent();

        out.print(left);
        out.println(",");
        out.print(right);
        out.println(",");
        out.print(dst);
        out.print(" <- ");
        out.print(src);

        out.outdent();
        out.print(")");
    }

    @Override
    public List<Label> getJumpTargets() {
        // Note: we can get away with not implementing this, because
        // we don't actually use this. This is because CJUMP is
        // treated as a special case in the trace scheduler algorithm.
        return List.empty();
    }

    public RelOp getOp() {
        return relop;
    }

    @Override
    public Label interp(X86_64SimFrame env) {
        Word l = left.interp(env);
        Word r = right.interp(env);
        switch (relop) {
            case LT:
                if (l.isLT(r))
                    dst.set(src.interp(env), env);
                return null;
            case NE:
                if (!l.isEQ(r))
                    dst.set(src.interp(env), env);
                return null;
            case EQ:
                if (l.isEQ(r))
                    dst.set(src.interp(env), env);
                return null;
            default:
                throw new Error("Missing case? " + relop);
        }
    }

    @Override
    public List<IRExp> kids() {
        if (dst instanceof MEM)
            return List.list(left, right, ((MEM) dst).exp, src);
        else
            return List.list(left, right, src);
    }

    public IRExp getLeft() {
        return left;
    }

    public IRExp getRight() {
        return right;
    }

    public IRExp getDst() {
        return dst;
    }

    public IRExp getSrc() {
        return src;
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
    public List<Temp> use() {
        List<Temp> suses = super.use(), ans;
        if (dst instanceof TEMP) {
            TEMP tdst = (TEMP) dst;
            ans = List.cons(tdst.temp, suses);
        } else {
            ans = suses;
        }
//		System.out.println("" + this.onOneLine() + " uses " + ans.onOneLine());
        return ans;
    }

    @Override
    public boolean mentionsMemOrCall() {
        return src.mentionsMemOrCall() || dst.mentionsMemOrCall() || left.mentionsMemOrCall() || right.mentionsMemOrCall();
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}
