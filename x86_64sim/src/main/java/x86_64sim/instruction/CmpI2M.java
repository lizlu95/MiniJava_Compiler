package x86_64sim.instruction;

import x86_64sim.State;

public class CmpI2M extends Instruction {
	long source, offset;
	String target;
	
	public CmpI2M(String source, String offset, String target) {
		this.source = Long.parseLong(source);
		this.offset = Long.parseLong(offset);
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		state.conditionr = source;
		state.conditionl = state.ram.read(state.getReg(target) + offset);
	}

	@Override
	public String toString() {
		return "\tcmpq\t$" + source + ", " + offset + "(" + target + ")";
	}

}
