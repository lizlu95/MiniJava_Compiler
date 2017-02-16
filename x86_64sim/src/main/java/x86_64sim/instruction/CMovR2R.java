package x86_64sim.instruction;

import x86_64sim.State;

public class CMovR2R extends Instruction {
	String condition, target, source;

	public CMovR2R(String condition, String source, String target) {
		this.condition = condition;
		this.source = source;
		this.target = target;
	}

	@Override
	public void execute(State state) {
		if (state.conditionTrue(condition)) {
			long value = state.getReg(source);
			if (state.beVerbose)
				System.out.println("cmov" + condition + " true " + target + " <- " + value);
			state.setReg(target, value);
		}
	}

	@Override
	public String toString() {
		return "\tcmov" + condition + "\t" + source + ", " + target;
	}

}
