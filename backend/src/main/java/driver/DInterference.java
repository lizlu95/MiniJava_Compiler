package driver;

import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;
import ir.interp.InterpMode;

import java.io.File;


import translate.Fragments;
import translate.Translator;

import codegen.AssemFragment;
import codegen.AssemProc;
import codegen.CodeGenerator;
import codegen.assem.Instr;

import analysis.FlowGraph;
import analysis.InterferenceGraph;


public class DInterference {

	public static final Frame architecture = X86_64Frame.factory;
	
	protected static InterpMode getSimulationMode() {
		// return null;
//		return InterpMode.LINEARIZED_IR;
		return InterpMode.BASIC_BLOCKS;
	}

	/**
	 * Given a source file, compile it and write the parse tree to System.out.
	 * 
	 * @param program  program to compile.
	 */
	public static void compile(File program) throws Exception {
		Fragments translated = Translator.translate(architecture, program);

		CodeGenerator cogen = new CodeGenerator();
	
		for (AssemFragment frag : cogen.apply(translated)) {
			if (frag instanceof AssemProc) {
				AssemProc proc = (AssemProc) frag;
				System.out.println("interference graph for : " + proc.getLabel());
				FlowGraph<Instr> flowGraph = FlowGraph.build(proc.getBody());
				InterferenceGraph interf = flowGraph.getInterferenceGraph();
				interf.name = proc.getLabel().toString();
				// interf.coalesce(architecture.registers().size(), false);
				System.out.println(interf);
			}
		}
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
