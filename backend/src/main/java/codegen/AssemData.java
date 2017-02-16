package codegen;

import ir.temp.Label;
import ir.tree.IR;
import ir.tree.IRExp;
import ir.tree.IRData;
import codegen.assem.Instr;
import codegen.muncher.Muncher;
import codegen.x86_64.X86_64Muncher;
import translate.DataFragment;
import util.IndentingWriter;
import util.List;

public class AssemData extends AssemFragment {

    private DataFragment dataIR;
    private List<Instr> asmBody;

    public AssemData(DataFragment dataIR) {
        this.dataIR = dataIR;
        rewrite(); // Actually not "re" writing, but writing for the first time :-)
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println(".data");
        out.indent();
        for (Instr instr : getBody()) {
            out.println(instr);
        }
        out.outdent();
    }

    public Label getLabel() {
        return dataIR.getBody().getLabel();
    }

    public List<Instr> getBody() {
        return asmBody;
    }

    public Muncher newMuncher() {
        return new X86_64Muncher(null);
    }

    public void rewrite() {
        IRData body = dataIR.getBody();
        Muncher m = newMuncher();
        m.munch(IR.LABEL(body.getLabel()));
        for (IRExp e : body) {
            m.munchData(e);
        }
        asmBody = m.getInstructions();
    }
}
