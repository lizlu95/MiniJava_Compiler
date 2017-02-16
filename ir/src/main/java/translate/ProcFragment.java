package translate;

import util.IndentingWriter;
import util.List;
import ir.canon.BasicBlocks;
import ir.canon.Canon;
import ir.canon.TraceSchedule;
import ir.frame.Frame;
import ir.temp.Label;
import ir.tree.IRStm;
import ir.tree.LABEL;

/**
 * A Method fragment represent the result of transforming a
 * minijava method declaration into IR code.
 */
public class ProcFragment extends Fragment {

    // Note that we keep all the different versions of the IR and Assem code.
    // In production code, you will only keep the "last" result
    // produced after trace scheduling. Even that could be thrown
    // away after the assembly has been produced to a file.
    // But having the different version here, though it takes up
    // memory is rather useful when you are debugging the compiler.

    private Frame frame;
    public boolean beVerbose = false;
    public boolean onOneLine = false;
    public boolean elidable = false;

    /**
     * The body of the method as returned by the translator.
     * Not processed in any way.
     */
    private IRStm body;

    /**
     * The result of linearizing body.
     */
    private List<IRStm> linearizedBody;

    /**
     * The result of applying the basic blocks algorithm to
     * linearizedBody.
     */
    private BasicBlocks blocks;

    /**
     * The result of applying the trace scheduling algorithm to
     * the basic blocks.
     */
    private List<IRStm> traceScheduled;

    public ProcFragment(Frame frame, IRStm body) {
        this.frame = frame;
        this.body = body;
    }

    public List<IRStm> getLinearizedBody() {
        if (linearizedBody == null) {
            linearizedBody = Canon.linearize(body);
        }
        return linearizedBody;
    }

    public BasicBlocks getBasicBlocks() {
        if (blocks == null) {
            blocks = new BasicBlocks(getLinearizedBody());
        }
        return blocks;
    }

    public List<IRStm> getTraceScheduledBody() {
        if (traceScheduled == null) {
            traceScheduled = new TraceSchedule(getBasicBlocks()).getProgram();
        }
        return traceScheduled;
    }


    @Override
    public void dump(IndentingWriter out) {
        out.println("MethodFragment {");
        out.indent();

        if (onOneLine) {
//			out.println("Code for " + frame.getLabel());
        } else {
            out.println(frame);
        }
        if (beVerbose) {
            out.println("body:");
            out.println(body);

            out.println("linearized:");
            out.println(getLinearizedBody());

            out.println("basic blocks:");
            out.println(getBasicBlocks());
            out.println("trace scheduled:");
        }
        if (onOneLine) {
            List<IRStm> body = getTraceScheduledBody();
            for (IRStm s : body)
                out.println(s.onOneLine());
        } else {
            out.println(getTraceScheduledBody());
        }

        out.outdent();
        out.print("}");
    }

    public Label getLabel() {
        return frame.getLabel();
    }

    public int wordSize() {
        return frame.wordSize();
    }

    public Frame getFrame() {
        return frame;
    }

    public IRStm getBody() {
        return body;
    }

    public void remove(IRStm stm) {
        // Should check that this doesn't break things horribly
        traceScheduled = traceScheduled.delete(stm);
    }

    public void replace(IRStm oldi, IRStm newi) {
        // Should check that this doesn't break things horribly
        assert(!(oldi instanceof LABEL));
        assert(!(newi instanceof LABEL));

        traceScheduled = traceScheduled.replace(oldi, newi);
    }

    public void replace(IRStm oldi, List<IRStm> newi) {
        // Should check that this doesn't break things horribly
        assert(!(oldi instanceof LABEL));

        traceScheduled = traceScheduled.replace(oldi, newi);
    }

    public void insertBefore(IRStm marker, IRStm newi) {
        traceScheduled = traceScheduled.insertBefore(marker, newi);
    }
}
