package ir.tree;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import ir.interp.Array;
import ir.interp.Ptr;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import util.DefaultIndentable;
import util.IndentingWriter;
import util.List;

public class IRData extends DefaultIndentable implements Iterable<IRExp> {
    static Map<Label, IRData> globalData = new HashMap<Label, IRData>();
    Array data = null;

    private int wordSize = 8;

    public void setWordSize(int wordSize) {
        this.wordSize = wordSize;
    }

    List<IRExp> values;
    Label label;

    public IRData(Label label, List<IRExp> values) {
        this.values = values;
        this.label = label;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println("IRData " + label + " " + values.size() + " values");
        out.indent();
        for (IRExp d : values)
            out.println(d);
        out.outdent();
    }

    public Word interpAsValue() {
        return data;
    }

    public void interp(X86_64SimFrame frame) {
        // As a statement, this is a no-op, but we need to establish the memory
        if (data == null) {
            data = new Array(values.size(), wordSize);
            for (int i = 0; i < values.size(); ++i) {
                IRExp e = values.get(i);
                Ptr p = data.add(i * wordSize);
                p.set(e.interp(frame));
            }
            globalData.put(label, this);
        }
    }

    public static IRData find(Label label) {
        return globalData.get(label);
    }

    public Label getLabel() {
        return label;
    }

    @Override
    public Iterator<IRExp> iterator() {
        return this.values.iterator();
    }
}
