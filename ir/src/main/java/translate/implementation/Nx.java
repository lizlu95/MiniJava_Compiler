package translate.implementation;

import ir.temp.Label;
import ir.tree.IRExp;
import ir.tree.IRStm;

/**
 * A TRExp wrapper around a statement.
 */
public class Nx extends TRExp {

    private final IRStm stm;

    public Nx(IRStm stm) {
        this.stm = stm;
    }

    @Override
    public IRStm unCx(Label ifTrue, Label ifFalse) {
        throw new Error("Bug in type checker? " +
                "-- In valid programs statements should never be converted to conditionals. ");
    }

    @Override
    public IRStm unCx(IRExp dst, IRExp src) {
        throw new Error("Bug in type checker? " +
                "-- In valid programs statements should never be converted to conditionals. ");
    }

    @Override
    public IRExp unEx() {
        throw new Error("Bug in type checker? " +
                "-- In valid programs statements should never be converted to expressions. ");
    }

    @Override
    public IRStm unNx() {
        return stm;
    }

}
