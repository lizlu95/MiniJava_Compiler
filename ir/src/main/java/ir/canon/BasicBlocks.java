package ir.canon;

import static ir.tree.IR.JUMP;
import static ir.tree.IR.LABEL;

import util.DefaultIndentable;
import util.IndentingWriter;
import util.List;
import ir.temp.Label;
import ir.tree.IRStm;
import ir.tree.LABEL;

public class BasicBlocks extends DefaultIndentable {

    /**
     * If the IR code didn't end with an explicit JUMP, we add one that jumps
     * to this generated done label. If the code did end with an explicit jump, then we
     * don't add a done label and this variable remains set to null.
     */
    public Label doneLabel = null;

    /**
     * We collect the basic blocks in this list. You can retrieve them from here.
     */
    public List<List<IRStm>> blocks = List.empty();

    private List<IRStm> currentBlock = null;

    private void startNewBlock(LABEL startLabel) {
        if (currentBlock != null) {
            // If the current block was not ended, it must mean it "falls through" without
            // an explicit jump.
            currentBlock.add(JUMP(startLabel.getLabel()));
            endCurrentBlock();
        }
        currentBlock = List.list((IRStm) startLabel);
    }

    private void endCurrentBlock() {
        assert(currentBlock != null) : "There is no current block";
        blocks.add(currentBlock);
        currentBlock = null;
    }

    private void mkBlocks(List<IRStm> l) {
        if (!(l.head() instanceof LABEL))
            l = List.cons(LABEL(Label.gen()), l);

        for (IRStm stm : l) {
            if (stm.isJump()) {
                currentBlock.add(stm);
                endCurrentBlock();
            } else if (stm instanceof LABEL) {
                startNewBlock((LABEL) stm);
            } else
                currentBlock.add(stm);
        }
        if (currentBlock != null) {
            //The code "fell of the end" without a JUMP.
            doneLabel = Label.generate("DONE");
            currentBlock.add(JUMP(doneLabel));
            endCurrentBlock();
        }
    }

    public BasicBlocks(List<IRStm> stms) {
        mkBlocks(stms);
    }

    @Override
    public void dump(IndentingWriter out) {
        out.println("List {");
        out.indent();

        for (List<IRStm> e : blocks)
            out.println(e);

        out.outdent();
        out.print("}");
    }
}
