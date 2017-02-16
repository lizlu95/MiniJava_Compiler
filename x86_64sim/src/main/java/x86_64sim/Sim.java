package x86_64sim;

import x86_64sim.parser.SimParser;

public class Sim {
	public static State ulate(String program) {
		return ulate(program, false);
	}
	public static State ulate(String program, boolean beVerbose) {
		if (beVerbose) System.out.print("Parsing string:\n"+ program);
		Program p;
		try {
			p = SimParser.parse(program);
		} catch (Error e) {
			System.out.println("Parsing problem, bailing");
			System.out.println("The program is:\n" + program);
			return null;
		}
		//			System.out.println("Program:");
		//			System.out.println(p.dump());
		State s = new State(p);
		s.beVerbose = beVerbose;
		String result = s.runForResult().result;
		System.out.println("Static: " + p.countInstructions() + " instructions generated");
		System.out.println("Dynamic: " + s.instructionsExecuted + " instructions executed");
		return s;
	}
}
