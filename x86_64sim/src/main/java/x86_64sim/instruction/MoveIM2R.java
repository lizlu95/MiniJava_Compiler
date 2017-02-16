package x86_64sim.instruction;

import x86_64sim.State;

public class MoveIM2R extends Instruction {
	long offset, scale;
	String source, target, index;
	
	public MoveIM2R(String offset, String source, String target, String index, String scale) {
		this.offset = Long.parseLong(offset);
		this.source = source;
		this.target = target;
		this.index = index;
		this.scale = Long.parseLong(scale);
	}
	
	@Override
	public void execute(State state) {
		long value = state.ram.read(state.getReg(source) + offset + state.getReg(index) * scale);
		if (state.beVerbose) 
			System.out.println(target + " <- " + value);
		state.setReg(target, value);
	}

	@Override
	public String toString() {
		return "\tmovq\t" + (offset == 0 ? "" : offset) + "(" + source + ", " + index + ", " + scale + "), " + target;
	}
}
