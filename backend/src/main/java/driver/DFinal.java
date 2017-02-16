package driver;

import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;

import java.io.File;

import util.Utils;

public class DFinal {

	public static final Frame architecture = X86_64Frame.factory;

	/**
	 * Given a source file, compile it and write the assembler to a .s file
	 * 
	 * @param program  program to compile.
	 */
	public static void compile(File program) throws Exception {
		Compiler compiler = new Compiler();

		String assemFileName = Utils.changeSuffix(program, "s");
		File assemFile = new File(assemFileName);

		System.out.println("compiling: "+program);
		compiler.compile(program, assemFile);
		System.out.println(">>>>>  "+assemFile);
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String program = args[0];
		try {
			compile(new File(program));
		} catch (Exception e) {
			System.out.println("Compilation problem");
			e.printStackTrace();
		}
	}

}
