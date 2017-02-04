package ir.visitor;

import util.List;
import ir.tree.*;

public class DefaultVisitor<R> implements Visitor<R> {


    @Override
    public <T extends IRNode> R visit(List<T> ns) {
        for (T e : ns)
            e.accept(this);
        return null;
    }

    @Override
    public R visit(CJUMP n) {
        n.left.accept(this);
        n.right.accept(this);
        return null;
    }

    @Override
    public R visit(CMOVE n) {
        n.left.accept(this);
        n.right.accept(this);
        n.dst.accept(this);
        n.src.accept(this);
        return null;
    }

    @Override
    public R visit(EXP n) {
        n.exp.accept(this);
        return null;
    }

    @Override
    public R visit(JUMP n) {
        n.exp.accept(this);
        return null;
    }

    @Override
    public R visit(LABEL n) {
        return null;
    }

    @Override
    public R visit(MOVE n) {
        n.dst.accept(this);
        n.src.accept(this);
        return null;
    }

    @Override
    public R visit(SEQ n) {
        n.left.accept(this);
        n.right.accept(this);
        return null;
    }

    @Override
    public R visit(BINOP n) {
        n.left.accept(this);
        n.right.accept(this);
        return null;
    }

    @Override
    public R visit(CALL n) {
        n.func.accept(this);
        for (IRExp e : n.args)
            e.accept(this);
        return null;
    }

    @Override
    public R visit(CONST n) {
        return null;
    }

    @Override
    public R visit(ESEQ n) {
        n.stm.accept(this);
        n.exp.accept(this);
        return null;
    }

    @Override
    public R visit(MEM n) {
        n.exp.accept(this);
        return null;
    }

    @Override
    public R visit(NAME n) {
        return null;
    }

    @Override
    public R visit(TEMP n) {
        return null;
    }

}
