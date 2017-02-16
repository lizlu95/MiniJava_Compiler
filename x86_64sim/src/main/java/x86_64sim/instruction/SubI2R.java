package x86_64sim.instruction;

import x86_64sim.State;

public class SubI2R extends Instruction {
	long source;
	String target;
	
	public SubI2R(String source, String target) {
		this.source = Long.parseLong(source);
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		long value = state.getReg(target) - source;
		if (state.beVerbose)
			System.out.println(target + " <- " + value);
		state.setReg(target, value);
	}
	@Override
	public String toString() {
		return "\tsubq\t$" + source + ", " + target;
	}
}
