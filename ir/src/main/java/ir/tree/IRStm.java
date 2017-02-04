package ir.tree;

import util.DefaultIndentable;
import util.List;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.temp.Temp;

abstract public class IRStm extends DefaultIndentable implements IRNode {
    //The book implements these methods on most statements
    abstract public List<IRExp> kids();

    abstract public IRStm build(List<IRExp> kids);

    static final List<Temp> empty = List.empty();

    /**
     * Simulate the execution of an atomic IRStm.
     * The statement may return a Label
     * if its execution causes an explicit transfer of control, or it may return null
     * for an implicit transfer of control to the next statement.
     */
    public abstract Label interp(X86_64SimFrame frame);

    /**
     * Is this particular statement a kind of jump (to be more precise,
     * is it a statement that transfers control explicitly rather than
     * "fall" into the next statement implicitly.
     */
    public boolean isJump() {
        return false;
        // Most statements aren't jumps. We must not forget to override
        // this method for those that are!
    }

    public boolean isMove() {
        return false;
    }

    /**
     * If this statement is a kind of JUMP, then this method should be
     * implemented and it should return a List of possible jump targets.
     * <p>
     * This method is used by the TraceScheduling algorithm. The order
     * in which the jumptargets are returned ...
     */
    public List<Label> getJumpTargets() {
        return List.empty();
    }

    public boolean mentions(Temp t) {
        for (IRExp k : kids()) {
            if (k.mentions(t)) return true;
        }
        return false;
    }

    public List<Temp> use() {
        List<Temp> answer = empty;
        for (IRExp k : kids()) {
            List<Temp> kuse = k.use();
            for (Temp t : kuse) {
                if (!answer.contains(t))
                    answer = List.cons(t, answer);
            }
        }
        return answer;
    }

    public List<Temp> def() {
        return empty;
    }

    public List<Label> jumps() {
        return getJumpTargets();
    }

    public boolean mentionsMemOrCall() {
        for (IRExp k : kids()) {
            if (k.mentionsMemOrCall()) return true;
        }
        return false;
    }
}

