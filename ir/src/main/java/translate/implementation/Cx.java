package translate.implementation;

import static ir.tree.IR.ESEQ;
import static ir.tree.IR.FALSE;
import static ir.tree.IR.LABEL;
import static ir.tree.IR.MOVE;
import static ir.tree.IR.SEQ;
import static ir.tree.IR.TEMP;
import static ir.tree.IR.TRUE;

import ir.temp.Label;
import ir.temp.Temp;
import ir.tree.IRExp;
import ir.tree.IRStm;
import ir.tree.TEMP;

public abstract class Cx extends TRExp {

    @Override
    public abstract IRStm unCx(Label ifTrue, Label ifFalse);

    public abstract IRStm unCx(IRExp dst, IRExp src);

    @Override
    public IRExp unEx() {
        TEMP r = TEMP(new Temp());
        return ESEQ(SEQ(MOVE(r, FALSE),
                unCx(r, TRUE)),
                r);
    }

    @Override
    public IRStm unNx() {
        Label end = Label.gen();
        return SEQ(unCx(end, end),
                LABEL(end));
    }

}
