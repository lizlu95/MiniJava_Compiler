package ir.frame.x86_64;

import static ir.tree.IR.MEM;
import static ir.tree.IR.PLUS;

import ir.frame.Access;
import ir.tree.IRExp;

public class InFrame extends Access {

    public int offset;

    InFrame(int offset) {
        this.offset = offset;
    }

    @Override
    public String toString() {
        return offset + "(%rbp)";
    }

    @Override
    public IRExp exp(IRExp fp) {
        return MEM(PLUS(fp, offset));
    }

}
