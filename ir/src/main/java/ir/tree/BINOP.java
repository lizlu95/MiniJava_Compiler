package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.visitor.Visitor;

public class BINOP extends IRExp {

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((binop == null) ? 0 : binop.hashCode());
        result = prime * result + ((left == null) ? 0 : left.hashCode());
        result = prime * result + ((right == null) ? 0 : right.hashCode());
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
        BINOP other = (BINOP) obj;
        if (binop != other.binop)
            return false;
        if (left == null) {
            if (other.left != null)
                return false;
        } else if (!left.equals(other.left))
            return false;
        if (right == null) {
            if (other.right != null)
                return false;
        } else if (!right.equals(other.right))
            return false;
        return true;
    }

    public Op binop;
    public IRExp left;
    public IRExp right;

    public IRExp getLeft() {
        return left;
    }

    public IRExp getRight() {
        return right;
    }

    public enum Op {
        PLUS, MINUS, MUL, DIV,
        AND, OR, LSHIFT, RSHIFT, ARSHIFT, XOR;
    }

    public BINOP(Op b, IRExp l, IRExp r) {
        binop = b;
        left = l;
        right = r;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.print("BINOP(");
        out.print(binop);
        out.println(",");
        out.indent();

        out.print(left);
        out.println(", ");
        out.print(right);

        out.outdent();
        out.print(")");
    }

    @Override
    public IRExp build(List<IRExp> kids) {
        return new BINOP(binop, kids.get(0), kids.get(1));
    }

    @Override
    public List<IRExp> kids() {
        return List.list(left, right);
    }

    @Override
    public Word interp(X86_64SimFrame env) {
        Word l = left.interp(env);
        Word r = right.interp(env);
        switch (binop) {
            case PLUS:
                return l.add(r);
            case MINUS:
                return l.minus(r);
            case MUL:
                return l.mul(r);
            case DIV:
                return l.div(r);
            case ARSHIFT:
                return l.arshift(r);
            //TODO: implement the other binops if you want to use them!
            default:
                throw new Error("Binop case missing? " + binop);
        }
    }

    public Op getOp() {
        return binop;
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

