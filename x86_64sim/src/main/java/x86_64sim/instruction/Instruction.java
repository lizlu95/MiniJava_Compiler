package x86_64sim.instruction;

import x86_64sim.State;

public abstract class Instruction {
	public static final String SP = "%rsp";
	public static final String BP = "%rbp";
	public static final String ARG1 = "%rdi";
	public static final String AX = "%rax";
	public static final String DX = "%rdx";

	abstract public void execute(State state);
	abstract public String toString();
}
