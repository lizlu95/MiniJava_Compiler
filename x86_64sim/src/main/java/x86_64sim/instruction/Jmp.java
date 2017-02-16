package x86_64sim.instruction;

import x86_64sim.State;

public class Jmp extends Instruction {
	String label;

	public Jmp(String label) {
		this.label = label;
	}

	@Override
	public void execute(State state) {
		if (state.beVerbose)
			System.out.println("jmp -> " + label);
		state.jump(label);
	}
	
	@Override
	public String toString() {
		return "\tjmp\t" + label;
	}
}
