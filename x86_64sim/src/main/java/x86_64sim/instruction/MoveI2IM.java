package x86_64sim.instruction;

import x86_64sim.State;

public class MoveI2IM extends Instruction {
	long offset, scale;
	String target, index;
	boolean isNumber = true;
	long source;
	String id;

	public MoveI2IM(String offset, String source, String target, String index, String scale) {
		this.offset = Long.parseLong(offset);
		try {
			this.source = Long.parseLong(source);
		} catch (NumberFormatException e) {
			// Must be a label, not a literal number
			isNumber = false;
			id = source;
		}
		this.target = target;
		this.index = index;
		this.scale = Long.parseLong(scale);
	}

	@Override
	public void execute(State state) {
		long address = state.getReg(target) + offset + state.getReg(index) * scale;
		long value;
		if (isNumber) 
			value = source;
		else {
			value = state.getLabel(id);
		}
		if (state.beVerbose)
			System.out.println("M[" + state.hex(address) + "] <- " + value);

		state.ram.write(address, value);
	}
	@Override
	public String toString() {
		return "\tmovq\t" + source + ", " + (offset == 0 ? "" : offset) + "(" + target + ", " + index + ", " + scale + ")";
	}
}
