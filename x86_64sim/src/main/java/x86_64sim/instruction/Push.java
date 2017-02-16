package x86_64sim.instruction;

import x86_64sim.Memory;
import x86_64sim.State;

public class Push extends Instruction {
	String reg;
	
	public Push(String reg) {
		this.reg = reg;
	}
	
	@Override
	public void execute(State state) {
		long sp = state.getReg(SP);
		long newsp = sp - Memory.SIZEOF_LONG;
		long value = state.getReg(reg);
		if (state.beVerbose) {
			System.out.println("M[" + state.hex(newsp) + "] <- " + value);
			System.out.println(SP + " <- " +  state.hex(newsp));
		}
		state.ram.write(newsp, value);
		state.setReg(SP, newsp);
	}

	@Override
	public String toString() {
		return "\tpushq\t" + reg;
	}
}
