package translate.implementation;

import ir.temp.Label;
import ir.tree.IRExp;
import ir.tree.IRStm;

/**
 * This abstract class helps to deal with "combinatorial
 * explosion" between different kinds of AST Expression nodes and the
 * different kinds of context in which they are used.
 * <p>
 * Translating a AST expression node into IR returns this instead of
 * an actual IRExp. The context in which it gets inserted can then
 * call one of the three methods this class defines to create a good
 * IRnode for its specific kind of use.
 * <p>
 * See the book pages 140 and onward for more explanation.
 */
public abstract class TRExp {
    /**
     * The expression is used in a context where an explicit result
     * value is required.
     */
    public abstract IRExp unEx();

    /**
     * The expression is used in a context that discards the value
     * (good compilation strategy may avoid producing it).
     */
    public abstract IRStm unNx();

    /**
     * The expression is used as the condition for a CJUMP.
     */
    public abstract IRStm unCx(Label ifTrue, Label ifFalse);

    /**
     * The expression is used as the condition for a CMOVE.
     */
    public abstract IRStm unCx(IRExp dst, IRExp src);

}
