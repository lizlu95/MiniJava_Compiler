package x86_64sim.instruction;

import x86_64sim.State;

public class CmpM2R extends Instruction {
	String target, source;
	long offset;
	
	public CmpM2R(String offset, String source, String target) {
		this.offset = Long.parseLong(offset);
		this.source = source;
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		long value = state.ram.read(state.getReg(source) + offset);

		state.conditionr = value;
		state.conditionl = state.getReg(target);
	}

	@Override
	public String toString() {
		return "\tcmpq\t" + offset + "(" + source + "), " + target;
	}

}
