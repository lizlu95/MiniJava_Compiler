package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.visitor.Visitor;

public class ESEQ extends IRExp {
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((exp == null) ? 0 : exp.hashCode());
        result = prime * result + ((stm == null) ? 0 : stm.hashCode());
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
        ESEQ other = (ESEQ) obj;
        if (exp == null) {
            if (other.exp != null)
                return false;
        } else if (!exp.equals(other.exp))
            return false;
        if (stm == null) {
            if (other.stm != null)
                return false;
        } else if (!stm.equals(other.stm))
            return false;
        return true;
    }

    public final IRStm stm;
    public final IRExp exp;

    public ESEQ(IRStm s, IRExp e) {
        stm = s;
        exp = e;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println("ESEQ(");
        out.indent();

        out.print(stm);
        out.println(",");
        out.print(exp);

        out.outdent();
        out.print(")");
    }

    @Override
    public IRExp build(List<IRExp> kids) {
        throw new Error("Not applicable to ESEQ");
    }

    @Override
    public List<IRExp> kids() {
        throw new Error("Not applicable to ESEQ");
    }

    @Override
    public Word interp(X86_64SimFrame env) {
        throw new Error("ESEQ is not atomic! Can only interp atomic statments!\n" +
                "  (linearized IR should not have any ESEQ!)");
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

