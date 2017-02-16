package x86_64sim.instruction;

import x86_64sim.Memory;
import x86_64sim.State;

public class Leave extends Instruction {
	public Leave() {
	}

	@Override
	public void execute(State state) {
		long sp = state.getReg(BP);
		long bp = state.ram.read(sp);
		long newsp = sp + Memory.SIZEOF_LONG;
		if (state.beVerbose) {
			System.out.println(BP + " <- " +  state.hex(bp));
			System.out.println(SP + " <- " +  state.hex(newsp));
		}
		state.setReg(BP, bp);
		state.setReg(SP, newsp);
	}
	@Override
	public String toString() {
		return "\tleave";
	}
}
