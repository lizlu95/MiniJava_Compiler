package translate;

import org.junit.jupiter.api.Assertions;
import util.IndentingWriter;
import util.List;
import ir.canon.BasicBlocks;
import ir.frame.Frame;
import ir.temp.Label;
import ir.tree.IRStm;
import ir.tree.LABEL;

/**
 * A Method fragment represent the result of transforming a
 * minijava method declaration into IR code.
 */
public class PartialProcFragment extends ProcFragment {

    // This version just keeps a list of statement
    private List<IRStm> body;

    public PartialProcFragment(List<IRStm> body) {
        super(null, null);
        this.body = body;
    }

    public List<IRStm> getLinearizedBody() {
        return body;
    }

    public BasicBlocks getBasicBlocks() {
        throw new Error("Not implemented");
    }

    public List<IRStm> getTraceScheduledBody() {
        return body;
    }


    @Override
    public void dump(IndentingWriter out) {
        out.println("PartialMethodFragment {");
        out.indent();
        out.println("body:");
        out.println(body);
        out.outdent();
        out.print("}");
    }

    public Label getLabel() {
        return Label.get("Just a partial fragment");
    }

    public int wordSize() {
        return 8;
    }

    public Frame getFrame() {
        return null;
    }

    public IRStm getBody() {
        throw new Error("Not implemented");
    }


    public void remove(IRStm stm) {
        // Should check that this doesn't break things horribly
        body = body.delete(stm);
    }

    public void replace(IRStm oldi, IRStm newi) {
        // Should check that this doesn't break things horribly
        Assertions.assertFalse(oldi instanceof LABEL);
        Assertions.assertFalse(newi instanceof LABEL);

        body = body.replace(oldi, newi);
    }

    public void replace(IRStm oldi, List<IRStm> newi) {
        // Should check that this doesn't break things horribly
        Assertions.assertFalse(oldi instanceof LABEL);

        body = body.replace(oldi, newi);
    }
}
