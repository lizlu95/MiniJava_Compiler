package x86_64sim.instruction;

import x86_64sim.State;

public class MoveI2R extends Instruction {
	boolean isNumber = true;
	long source;
	String id;
	String target;
	
	public MoveI2R(String source, String target) {
		try {
			this.source = Long.parseLong(source);
		} catch (NumberFormatException e) {
			// Must be a label, not a literal number
			isNumber = false;
			id = source;
		}
		this.target = target;
	}
	
	@Override
	public void execute(State state) {
		long value;
		if (isNumber) 
			value = source;
		else {
			value = state.getLabel(id);
		}
		if (state.beVerbose)
			System.out.println(target + " <- " +  value);

		state.setReg(target, value);
	}

	@Override
	public String toString() {
		return "\tmovq\t" + source + ", " + target;
	}
}
