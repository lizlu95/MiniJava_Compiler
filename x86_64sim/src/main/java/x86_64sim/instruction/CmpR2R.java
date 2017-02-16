package x86_64sim.instruction;

import x86_64sim.State;

public class CmpR2R extends Instruction {
	String target, source;
	
	public CmpR2R(String source, String target) {
		this.source = source;
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		state.conditionr = state.getReg(source);
		state.conditionl = state.getReg(target);
	}

	@Override
	public String toString() {
		return "\tcmpq\t" + source + ", " + target;
	}

}
