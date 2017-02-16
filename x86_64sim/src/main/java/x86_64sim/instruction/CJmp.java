package x86_64sim.instruction;

import x86_64sim.State;

public class CJmp extends Instruction {
	String condition, label;

	public CJmp(String condition, String label) {
		this.condition = condition;
		this.label = label;
	}

	@Override
	public void execute(State state) {
		if (state.conditionTrue(condition)) {
			if (state.beVerbose)
				System.out.println("j" + condition + " taken -> " + label);
			state.jump(label);
		}
	}

	@Override
	public String toString() {
		return "\tj" + condition + "\t" + label;
	}

}
