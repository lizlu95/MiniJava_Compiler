package x86_64sim.instruction;

import x86_64sim.State;

public class MoveR2M extends Instruction {
	long offset;
	String source, target;
	
	public MoveR2M(String offset, String source, String target) {
		this.offset = Long.parseLong(offset);
		this.source = source;
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		long address = state.getReg(target) + offset;
		long value = state.getReg(source);
		if (state.beVerbose)
			System.out.println("M[" + state.hex(address) + "] <- " + value);
		state.ram.write(address, value);
	}
	@Override
	public String toString() {
		return "\tmovq\t" + source + ", " + (offset == 0 ? "" : offset) + "(" + target + ")";
	}
}
