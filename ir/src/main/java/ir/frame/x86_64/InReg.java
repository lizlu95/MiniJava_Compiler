package ir.frame.x86_64;

import ir.frame.Access;
import ir.temp.Temp;
import ir.tree.IR;
import ir.tree.IRExp;

class InReg extends Access {

    private Temp name;

    InReg(Temp name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name.toString();
    }

    @Override
    public IRExp exp(IRExp framePtr) {
        return IR.TEMP(name);
    }

}
