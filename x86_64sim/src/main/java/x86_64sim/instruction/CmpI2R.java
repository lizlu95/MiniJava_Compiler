package x86_64sim.instruction;

import x86_64sim.State;

public class CmpI2R extends Instruction {
	long source;
	String target;
	
	public CmpI2R(String source, String target) {
		this.source = Long.parseLong(source);
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		state.conditionr = source;
		state.conditionl = state.getReg(target);
	}

	@Override
	public String toString() {
		return "\tcmpq\t$" + source + ", " + target;
	}

}
