package ir.tree;

import util.IndentingWriter;
import util.List;
import ir.interp.Callable;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.visitor.Visitor;

public class CALL extends IRExp {
    public IRExp func;
    public List<IRExp> args;

    public CALL(IRExp f, List<IRExp> a) {
        func = f;
        args = a;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println("CALL(");
        out.indent();

        out.print(func);
        for (IRExp arg : args) {
            out.println(",");
            out.print(arg);
        }
        out.outdent();
        out.print(")");
    }

    @Override
    public IRExp build(List<IRExp> kids) {
        return new CALL(kids.head(), kids.tail());
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((args == null) ? 0 : args.hashCode());
        result = prime * result + ((func == null) ? 0 : func.hashCode());
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
        CALL other = (CALL) obj;
        if (args == null) {
            if (other.args != null)
                return false;
        } else if (!args.equals(other.args))
            return false;
        if (func == null) {
            if (other.func != null)
                return false;
        } else if (!func.equals(other.func))
            return false;
        return true;
    }

    @Override
    public List<IRExp> kids() {
        return List.cons(func, args);
    }

    @Override
    public Word interp(X86_64SimFrame env) {
        Callable procVal = (Callable) func.interp(env);
        List<Word> argVals = List.list();
        for (IRExp arg : args) {
            argVals.add(arg.interp(env));
        }
        return procVal.call(env.getInterp(), argVals);
    }

    public IRExp getFunc() {
        return func;
    }

    public List<IRExp> getArgs() {
        return args;
    }

    @Override
    public boolean mentionsMemOrCall() {
        return true;
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

