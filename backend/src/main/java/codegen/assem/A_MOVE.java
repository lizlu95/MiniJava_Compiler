package codegen.assem;

import static util.List.list;

import util.IndentingWriter;
import util.List;
import ir.temp.Label;
import ir.temp.Temp;

public class A_MOVE extends Instr {
    public Temp dst;
    public Temp src;

    public A_MOVE(String a, Temp d, Temp s) {
        super(a);
        dst = d;
        src = s;
    }

    public List<Temp> use() {
        return list(src);
    }

    public List<Temp> def() {
        return list(dst);
    }

    public List<Label> jumps() {
        return null;
    }

    @Override
    public void dump(IndentingWriter out) {
        if (dst.getColor() != null && dst.getColor().equals(src.getColor())) {
            out.print("# "); // comment out this redundant move
        }
        super.dump(out);
    }

    @Override
    public Instr clone(List<Temp> oldtemps, List<Temp> newtemps) {
        Temp news = src;
        Temp newd = dst;
        for (int i = 0; i < oldtemps.size(); ++i) {
            Temp oldt = oldtemps.get(i);
            Temp newt = newtemps.get(i);
            if (oldt.equals(src))
                news = newt;
            if (oldt.equals(dst))
                newd = newt;
        }
        return new A_MOVE(assem, newd, news);
    }
}
