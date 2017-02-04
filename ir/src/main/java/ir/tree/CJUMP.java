package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.visitor.Visitor;

public class CJUMP extends IRStm {
    public enum RelOp {
        EQ, NE, LT, GT, LE, GE,
        ULT, ULE, UGT, UGE;

        public RelOp not() {
            switch (this) {
                case EQ:
                    return NE;
                case NE:
                    return EQ;
                case LT:
                    return GE;
                case GE:
                    return LT;
                case GT:
                    return LE;
                case LE:
                    return GT;
                case ULT:
                    return UGE;
                case UGE:
                    return ULT;
                case UGT:
                    return ULE;
                case ULE:
                    return UGT;
                default:
                    throw new Error("Missing case in RelOp.not()?");
            }
        }

        public RelOp swap() {
            switch (this) {
                case EQ:
                    return EQ;
                case NE:
                    return NE;
                case LT:
                    return GT;
                case GE:
                    return LE;
                case GT:
                    return LT;
                case LE:
                    return GE;
                case ULT:
                    return UGT;
                case UGE:
                    return ULE;
                case UGT:
                    return ULT;
                case ULE:
                    return UGE;
                default:
                    throw new Error("Missing case in RelOp.swap()?");
            }

        }
    }

    public RelOp relop;
    public IRExp left;
    public IRExp right;
    public Label iftrue;
    public Label iffalse;

    public CJUMP(RelOp rel, IRExp l, IRExp r, Label t, Label f) {
        relop = rel;
        left = l;
        right = r;
        iftrue = t;
        iffalse = f;
    }

    @Override
    public IRStm build(List<IRExp> kids) {
        return new CJUMP(relop, kids.get(0), kids.get(1), iftrue, iffalse);
    }

    public IRStm changeFalseLabel(Label newFalseLabel) {
        return new CJUMP(relop, left, right, iftrue, newFalseLabel);
    }

    @Override
    public void dump(IndentingWriter out) {
        out.print("CJUMP(");
        out.print(relop);
        out.println(",");
        out.indent();

        out.print(left);
        out.println(",");
        out.print(right);
        out.println(",");
        out.print(iftrue);
        out.print(", ");
        out.print(iffalse);

        out.outdent();
        out.print(")");
    }

    /**
     * Flip the branches of the CJUMP (without changing its meaning:
     * the condition is also "flipped").
     */
    public CJUMP flip() {
        return new CJUMP(relop.not(), left, right, iffalse, iftrue);
    }

    public Label getFalseLabel() {
        return iffalse;
    }

    @Override
    public List<Label> getJumpTargets() {
        // Note: we can get away with not implementing this, because
        // we don't actually use this. This is because CJUMP is
        // treated as a special case in the trace scheduler algo.
        throw new Error("Not implemented");
    }

    public RelOp getOp() {
        return relop;
    }

    public Label getTrueLabel() {
        return iftrue;
    }

    @Override
    public Label interp(X86_64SimFrame env) {
        Word l = left.interp(env);
        Word r = right.interp(env);
        switch (relop) {
            case LT:
                return l.isLT(r) ? iftrue : iffalse;
            case GE:
                return l.isLT(r) ? iffalse : iftrue;
            case ULT:
                return l.isULT(r) ? iftrue : iffalse;
            case UGE:
                return l.isULT(r) ? iffalse : iftrue;
            case NE:
                return l.isEQ(r) ? iffalse : iftrue;
            case EQ:
                return l.isEQ(r) ? iftrue : iffalse;

            default:
                throw new Error("Missing case? " + relop);
        }
    }

    @Override
    public boolean isJump() {
        return true;
    }

    @Override
    public List<IRExp> kids() {
        return List.list(left, right);
    }

    public IRExp getLeft() {
        return left;
    }

    public IRExp getRight() {
        return right;
    }

    @Override
    public List<Label> jumps() {
        return List.list(iftrue, iffalse);
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

