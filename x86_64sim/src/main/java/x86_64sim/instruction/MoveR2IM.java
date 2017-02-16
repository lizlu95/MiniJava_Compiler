package x86_64sim.instruction;

import x86_64sim.State;

public class MoveR2IM extends Instruction {
	long offset, scale;
	String source, target, index;

	public MoveR2IM(String offset, String source, String target, String index, String scale) {
		this.offset = Long.parseLong(offset);
		this.source = source;
		this.target = target;
		this.index = index;
		this.scale = Long.parseLong(scale);
	}

	@Override
	public void execute(State state) {
		long address = state.getReg(target) + offset + state.getReg(index) * scale;
		long value = state.getReg(source);
		if (state.beVerbose)
			System.out.println("M[" + state.hex(address) + "] <- " + value);

		state.ram.write(address, value);
	}
	@Override
	public String toString() {
		return "\tmovq\t" + source + ", " + (offset == 0 ? "" : offset) + "(" + target + ", " + index + ", " + scale + ")";
	}
}
