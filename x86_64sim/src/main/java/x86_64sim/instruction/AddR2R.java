package x86_64sim.instruction;

import x86_64sim.State;

public class AddR2R extends Instruction {
    String target, source;

    public AddR2R(String source, String target) {
        this.source = source;
        this.target = target;
    }

    @Override
    public void execute(State state) {
        long value = state.getReg(target) + state.getReg(source);
        if (state.beVerbose)
            System.out.println(target + " <- " + value);
        state.setReg(target, value);
    }

    @Override
    public String toString() {
        return "\taddq\t" + source + ", " + target;
    }

}
