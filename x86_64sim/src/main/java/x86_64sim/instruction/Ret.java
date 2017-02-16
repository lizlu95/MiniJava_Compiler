package x86_64sim.instruction;

import x86_64sim.Memory;
import x86_64sim.State;

public class Ret extends Instruction {
	public Ret() {
	}

	@Override
	public void execute(State state) {
		long sp = state.getReg(SP);
		long ra = state.ram.read(sp);
		long newsp = sp + Memory.SIZEOF_LONG;
		if (state.beVerbose) {
			System.out.println("Return to " + ra + " " + state.p.getFunctionAt(ra));
			System.out.println(SP + " <- " +  state.hex(newsp));
		}
		state.setReg(SP, newsp);
		state.do_return();
		state.jump(ra);
	}
	@Override
	public String toString() {
		return "\tret";
	}
}
