package driver;

import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;


import translate.Fragments;
import translate.Translator;

import codegen.AssemFragment;
import codegen.AssemProc;
import codegen.CodeGenerator;
import codegen.assem.Instr;

import analysis.FlowGraph;


public class DFlowGraph {

	public static final Frame architecture = X86_64Frame.factory;

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
				System.out.println("flow graph for : " + proc.getLabel());
				FlowGraph<Instr> flowGraph = FlowGraph.build(proc.getBody());
				System.out.println(flowGraph);
				File out = new File("flow-" + proc.getLabel() + ".dot");
				try {
					PrintStream outb = new PrintStream(out);
					outb.print(flowGraph.dotString(proc.getLabel().toString()));
					outb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
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
