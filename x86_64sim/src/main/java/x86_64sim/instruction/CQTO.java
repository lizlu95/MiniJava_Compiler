package x86_64sim.instruction;

import x86_64sim.Memory;
import x86_64sim.State;

public class CQTO extends Instruction {
	public CQTO() {
	}

	@Override
	public void execute(State state) {
		long ax = state.getReg(Instruction.AX);
		long dx = ax > 0 ? 0 : -1;
		if (state.beVerbose) 
			System.out.println(DX + " <- " +  dx);
		state.setReg(DX, dx);
	}
	@Override
	public String toString() {
		return "\tcqto";
	}
}
