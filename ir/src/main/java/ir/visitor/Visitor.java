package ir.visitor;

import util.List;
import ir.tree.*;

/**
 * A modernized version of the Visitor interface, adapted from the textbook's
 * version.
 * <p>
 * Changes: this visitor allows you to return something as a result.
 * The "something" can be of any particular type, so the Visitor
 * uses Java generics to express this.
 *
 * @author kdvolder
 */
public interface Visitor<R> {

    //Lists
    public <T extends IRNode> R visit(List<T> ns);

    //IRStms
    public R visit(CJUMP n);

    public R visit(CMOVE n);

    public R visit(EXP n);

    public R visit(JUMP n);

    public R visit(LABEL n);

    public R visit(MOVE n);

    public R visit(SEQ n);

    //Types
    public R visit(BINOP n);

    public R visit(CALL n);

    public R visit(CONST n);

    public R visit(ESEQ n);

    //Statements
    public R visit(MEM n);

    public R visit(NAME n);

    public R visit(TEMP n);
}
