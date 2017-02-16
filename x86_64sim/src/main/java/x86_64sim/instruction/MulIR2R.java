package x86_64sim.instruction;

import x86_64sim.State;

public class MulIR2R extends Instruction {
	long immediate;
	String source;
	String target;
	
	public MulIR2R(String immediate, String source, String target) {
		this.immediate = Long.parseLong(immediate);
		this.source = source;
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		long value = state.getReg(source) * immediate;
		if (state.beVerbose)
			System.out.println(target + " <- " + value);
		state.setReg(target, value);
	}
	@Override
	public String toString() {
		return "\timulq\t$" + immediate + ", " + source + ", " + target;
	}
}
