package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.Ptr;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.visitor.Visitor;

public class MEM extends IRExp {
    public final IRExp exp;

    public MEM(IRExp e) {
        exp = e;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.print("MEM(");
        out.print(exp);
        out.print(")");
    }

    @Override
    public IRExp build(List<IRExp> kids) {
        return new MEM(kids.head());
    }

    @Override
    public List<IRExp> kids() {
        return List.list(exp);
    }

    @Override
    public Word interp(X86_64SimFrame env) {
        //Subtle point: we only get here if the MEM is being read.
        //The interp for MOVE treats the MEM case in its dst explicitly.
        Ptr p = (Ptr) exp.interp(env);
        return p.get();
    }

    @Override
    public void set(Word value, X86_64SimFrame env) {
        Ptr d = (Ptr) exp.interp(env);
        d.set(value);
    }

    @Override
    public boolean mentionsMemOrCall() {
        return true;
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((exp == null) ? 0 : exp.hashCode());
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
        MEM other = (MEM) obj;
        if (exp == null) {
            if (other.exp != null)
                return false;
        } else if (!exp.equals(other.exp))
            return false;
        return true;
    }
}

