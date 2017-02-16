package x86_64sim.instruction;

import x86_64sim.State;

public class Inc extends Instruction {
	String reg;
	
	public Inc(String reg) {
		this.reg = reg;
	}
	
	@Override
	public void execute(State state) {
		long value = state.getReg(reg) + 1;
		if (state.beVerbose)
			System.out.println(reg + " <- " + value);
		state.setReg(reg, value);
	}

	@Override
	public String toString() {
		return "\tincq\t" + reg;
	}
}
