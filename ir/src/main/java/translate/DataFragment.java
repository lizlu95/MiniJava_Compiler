package translate;

import util.IndentingWriter;
import util.List;
import ir.frame.Frame;
import ir.interp.Interp;
import ir.interp.Word;
import ir.temp.Label;
import ir.tree.IRData;

/**
 * A Data fragment holding global data.
 */
public class DataFragment extends Fragment {
    public int wordSize = 8;
    private IRData data;
    private Frame frame;

    public DataFragment(Frame frame, IRData body) {
        this.frame = frame;
        if (frame != null)
            this.wordSize = frame.wordSize();
        this.data = body;
    }

    public IRData getBody() {
        return data;
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println("DataFragment {");
        out.indent();

        out.println(data);
        out.outdent();
        out.print("}");
    }

    public void setWordSize(int wordSize) {
        this.wordSize = wordSize;
        data.setWordSize(wordSize);
    }

    public Label getLabel() {
        return data.getLabel();
    }

    public void interp(Interp interp) {
        data.interp(frame.newSimFrame(interp, List.list(new Word[0])));
    }
}
