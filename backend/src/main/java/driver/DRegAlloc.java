package driver;

import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;
import ir.temp.Color;
import ir.temp.Temp;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;


import translate.Fragments;
import translate.Translator;

import codegen.AssemFragment;
import codegen.AssemProc;
import codegen.CodeGenerator;

import analysis.FlowGraph;
import analysis.InterferenceGraph;
import analysis.RegAlloc;
import analysis.util.graph.Node;


public class DRegAlloc {

	public static final Frame architecture = X86_64Frame.factory;
	private static boolean beVerbose = true;

	private static void remember(Map<String, Set<String>> regToTemp, 
			Map<String, String> tempToReg, String reg, String temp) {
		Set<String> s = regToTemp.get(reg);
		if (s == null) {
			s = new HashSet<String>();
			regToTemp.put(reg, s);
		}
		s.add(temp);
		tempToReg.put(temp, reg);
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
				System.out.println("Fragment: " + proc.getLabel());

				RegAlloc alloc = RegAlloc.doit(proc);

				if (beVerbose) {
					System.out.println(alloc.getTrace());
				} else {

					InterferenceGraph ig = FlowGraph.build(proc.getBody()).getInterferenceGraph();
					Map<String, Set<String>> regToTemp = new HashMap<String, Set<String>>();
					Map<String, String> tempToReg = new HashMap<String, String>();
					for (Node<Temp> node : ig.nodes()) {
						Temp t = node.wrappee();
						Color color = t.getColor();
						if (!t.getName().equals(color.toString()))
							remember(regToTemp, tempToReg, color.toString(), t.getName());
					}
					System.out.println("Temp to register map:");
					List<String> keys = new ArrayList<String>(tempToReg.keySet());
					Collections.sort(keys);
					for (String temp : keys) {
						String reg = tempToReg.get(temp);
						System.out.println(temp + " -> " + reg);
					}

					System.out.println();
					System.out.println("Register to temps:");

					keys = new ArrayList<String>(regToTemp.keySet());
					Collections.sort(keys);
					for (String reg : keys) {
						Set<String> temps = regToTemp.get(reg);
						System.out.println(reg + ": " + temps);
					}
				}
				System.out.println();
				System.out.println("final code for : " + proc.getLabel());
				System.out.println(proc);
			}
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		String program = args[0];
		if (args.length > 1)
			beVerbose = args[1].equals("-v");
		compile(new File(program));
	}

}
