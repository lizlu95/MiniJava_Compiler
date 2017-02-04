package ir.frame.x86_64;

import static ir.tree.IR.MEM;
import static ir.tree.IR.PLUS;
import static ir.tree.IR.TEMP;

import ir.frame.Access;
import ir.tree.IRExp;

public class InArg extends Access {

    private IRExp irCode;
    private int offset;

    public InArg(int i) {
        if (i < X86_64Frame.arguments.size()) {
            offset = -1;
            irCode = TEMP(X86_64Frame.arguments.get(i));
        } else {
            offset = (i - X86_64Frame.arguments.size() + 2) * X86_64Frame.WORD_SIZE;
            irCode = MEM(PLUS(TEMP(X86_64Frame.FP), offset));
        }
    }

    @Override
    public IRExp exp(IRExp temp) {
        return irCode;
    }

    @Override
    public String toString() {
        if (offset == -1) {
            return irCode.toString();
        } else {
            return "" + offset + "(%rbp)";
        }
    }

}
