package x86_64sim.instruction;

import x86_64sim.State;

public class CmpR2M extends Instruction {
	String target, source;
	long offset;
	
	public CmpR2M(String source, String offset, String target) {
		this.offset = Long.parseLong(offset);
		this.source = source;
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		long value = state.ram.read(state.getReg(target) + offset);

		state.conditionr = state.getReg(source);
		state.conditionl = value;
	}

	@Override
	public String toString() {
		return "\tcmpq\t" + source + ", " + offset + "(" + target + ")";
	}

}
