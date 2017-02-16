package x86_64sim.instruction;

import x86_64sim.State;

public class Lea extends Instruction {
	String base, index, target, id;
	long offset, scale;
	
	public Lea(String offset, String base, String target, String index, String scale) {
		this.base = base;
		this.index = index;
		this.target = target;
		this.offset = Long.parseLong(offset);
		this.scale = Long.parseLong(scale);
	}
	
	public Lea(String offset, String base, String target) {
		this.base = base;
		this.index = null;
		this.target = target;
		this.offset = Long.parseLong(offset);
		this.scale = 1;
	}
		
	public Lea(String id, String target) {
		this.id = id;
		this.target = target;
		this.scale = 1;
	}
		
	@Override
	public void execute(State state) {
		long value;
		if (id != null) {
			value = state.p.getLabel(id);
		} else {
			value = offset + (base == null ? 0 : state.getReg(base)) + (index == null ? 0 : state.getReg(index) * scale);
		}
		if (state.beVerbose)
			System.out.println(target + " <- " + value);
		state.setReg(target, value);
	}

	@Override
	public String toString() {
		if (id != null)
			return "\tleaq\t" + id + "(%rip), " + target;
		else 
			return "\tleaq\t" + offset + "(" + base + (index == null ? "" : ", " + index + (scale == 1 ? "" : ", " + scale)) + "), " + target;
	}
}
