package codegen;

import translate.ProcFragment;
import util.IndentingWriter;
import util.List;

import static util.List.list;
import static util.List.cons;

import util.Utils;
import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;
import ir.temp.Label;
import ir.temp.Temp;
import ir.tree.IRStm;
import codegen.assem.A_LABEL;
import codegen.assem.A_OPER;
import codegen.assem.Instr;
import codegen.muncher.Muncher;
import codegen.x86_64.X86_64Muncher;

/**
 * A class that represents the assembly code for a procedure. Since this is
 * specific to target architecture, this class may need subclasses
 * for different target architectures.
 * <p>
 * This implementation provided prints out procedure sequence that will work
 * for GAS (the GNU assembler). This should be portable for different target
 * architectures (since GAS is).
 *
 * @author kdvolder
 */
public class AssemProc extends AssemFragment {

    private Frame frame;
    private ProcFragment procIR;
    private List<Instr> asmBody;

    public AssemProc(ProcFragment procIR) {
        this.frame = procIR.getFrame();
        this.procIR = procIR;
        rewrite(); // Actually not "re" writing, but writing for the first time :-)
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println(".text");
        out.println(".globl " + getLabel());
        if (!Utils.macOS())
            out.println("     .type " + getLabel() + ", @function");

        out.println(getLabel() + ":");
        out.indent();

        frame.entrySequence(out);
        for (Instr instr : getBody()) {
            out.println(instr);
        }
        frame.exitSequence(out);
        if (!Utils.macOS())
            out.println(".size " + getLabel() + ", .-" + getLabel());

        out.outdent();
    }

    public void remove(Instr instr) {
        // Should check that this doesn't break things horribly
        asmBody = asmBody.delete(instr);
    }

    public void replace(Instr oldi, Instr newi) {
        // Should check that this doesn't break things horribly
        assert (!(oldi instanceof A_LABEL));
        assert (!(newi instanceof A_LABEL));

        asmBody = asmBody.replace(oldi, newi);
    }

    public Label getLabel() {
        return frame.getLabel();
    }

    public List<Instr> getBody() {
        return asmBody;
    }

    public Frame getFrame() {
        return frame;
    }

    /**
     * After doing register allocation with spilled registers. You can use
     * this method to rewrite the instructions in the body from the IR.
     * <p>
     * To make this actually work, you will need to do something to define
     * proper code generation rules to handle spilled Temps.
     * <p>
     * (At least) two options are available:
     * - define special patterns and rules to match spilled temps explicitly.
     * - alter the implementation of MEMPat to allow it to match not just
     * MEM nodes but also spilled Temp nodes.
     */

    public List<Instr> procEntryExit2(List<Instr> asmBody) {
        List<Temp> returnSink = cons(X86_64Frame.RV, X86_64Frame.special.append(X86_64Frame.calleeSave));
        asmBody.add(new A_OPER("# return sink", list(new Temp[0]), returnSink));
        return asmBody;
    }

    public Muncher newMuncher() {
        return new X86_64Muncher(frame, false);
    }

    public void rewrite() {
        List<IRStm> body = procIR.getTraceScheduledBody();
        Muncher m = newMuncher();
        for (IRStm stm : body) {
            m.munch(stm);
        }
        this.asmBody = procEntryExit2(m.getInstructions());
    }

    public void setAsm(List<Instr> body) {
        asmBody = body;
        procIR = null;
    }

}
