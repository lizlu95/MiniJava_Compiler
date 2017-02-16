package x86_64sim.instruction;

import x86_64sim.State;

public class Dec extends Instruction {
	String reg;
	
	public Dec(String reg) {
		this.reg = reg;
	}
	
	@Override
	public void execute(State state) {
		long value = state.getReg(reg) - 1;
		if (state.beVerbose)
			System.out.println(reg + " <- " + value);
		state.setReg(reg, value);
	}

	@Override
	public String toString() {
		return "\tdecq\t" + reg;
	}

}
