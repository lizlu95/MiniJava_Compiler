package x86_64sim.instruction;

import x86_64sim.State;

public class DivR extends Instruction {
	String source;
	
	public DivR(String source) {
		this.source = source;
	}
	
	@Override
	public void execute(State state) {
		long ax = state.getReg(Instruction.AX);
		long src = state.getReg(source);
		long quot = ax / src;
		long rem = ax % src;
		if (state.beVerbose) 
			System.out.println(Instruction.AX + " <- " + quot + "; " + Instruction.DX + " <- " + rem);
		state.setReg(Instruction.AX, quot);
		state.setReg(Instruction.DX, rem);
	}

	@Override
	public String toString() {
		return "\tidivq\t" + source;
	}
}
