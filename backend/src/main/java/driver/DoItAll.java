package driver;

import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;
import ir.interp.Interp;
import ir.interp.InterpMode;
import ir.temp.Color;
import ir.temp.Temp;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import codegen.AssemFragment;
import codegen.AssemProc;
import codegen.Assembly;
import codegen.CodeGenerator;
import codegen.assem.Instr;

import parser.Parser;
import parser.jcc.ParseException;
import analysis.FlowGraph;
import analysis.InterferenceGraph;
import analysis.Liveness;
import analysis.RegAlloc;
import analysis.implementation.LivenessImplementation;
import analysis.util.graph.Node;
import ast.Program;

import translate.Fragment;
import translate.Fragments;
import translate.ProcFragment;
import translate.implementation.TranslateImplementation;
import typechecker.TypeChecked;
import typechecker.TypeCheckerException;
import typechecker.implementation.TypeCheckerImplementation;
import util.IndentingWriter;
import util.RunCommand;
import util.Utils;
import x86_64sim.Sim;

public class DoItAll {
	Map<String, String> args;
	private static final Frame architecture = X86_64Frame.factory;
	private File file;
	private File assemFile;

	public DoItAll(Map<String, String> args) {
		this.args = args;
		setup();
	}

	private String runInterp(Interp interp) {
		String result = "";
		try {
			result = interp.run();
		} catch (Exception e) {
			result = e.getMessage();
		} catch (Error e) {
			result = e.getMessage();
		}
		return result;
	}

	private void checkAnswer(String output) {
		System.out.print("Checking answer ...");
		File outfile = new File(Utils.changeSuffix(file, "out"));
		String expected = Utils.getContents(outfile);
		if (!expected.equals(output)) {
			System.out.println(" incorrect");
			File toutfile = new File(Utils.changeSuffix(file, "tout"));
			Utils.setContents(toutfile, output);
			RunCommand result = null;
			try {
				result = new RunCommand(
						new String[] {
								"diff", "-c", "-b", outfile.toString(), toutfile.toString()
						}, 
						true, true);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (result == null) {
				System.out.println("Couldn't run diff");
			} else if (result.getReturnCode() != 0) {
				System.out.print(result.getOutput()+"\n"+result.getErrorOutput());
			} else {
				System.out.print(result.getOutput());
			}
		} else {
			System.out.println(" correct");
		}
	}

	private void setup() {
		if (args.containsKey("execute") && !args.containsKey("dots"))
			args.put("dots", "");
		if (args.containsKey("dots") && !args.containsKey("register"))
			args.put("register", "");
		if ((args.containsKey("register") || args.containsKey("simulate"))
				&& !args.containsKey("code"))
			args.put("code", "");
		if (args.containsKey("code")
				&& !args.containsKey("translate"))
			args.put("translate", "");
		if (args.containsKey("translate") && !args.containsKey("typecheck"))
			args.put("typecheck", "");
		if (args.containsKey("typecheck") && !args.containsKey("parse"))
			args.put("parse", "");
	}

	public DoItAll(String[] args) {
		Pattern x = Pattern.compile("^(.*)=(.*)$");
		Matcher m = x.matcher("");
		this.args = new HashMap<String, String>();
		for (String s : args) {
			m.reset(s);
			if (m.find()) {
				String pass = m.group(1);
				String flags = m.group(2);
				this.args.put(pass, flags);
			}
		}
		setup();
	}

	public void go(String input) {
		Program program = null;
		TypeCheckerImplementation tc = null;
		TypeChecked typechecked = null;
		Fragments frags = null;
		Assembly assembly = null;
		String flags = args.get("parse");
		if (flags != null) {
			try {
				program = Parser.parse(input);
			} catch (ParseException e) {
				System.out.println("Parsing failed\n");
				e.printStackTrace();
				return;
			}
			if (flags.contains("verbose")) {
				System.out.println("Parse tree:");
				System.out.println(program.dump());
			}
		} else 
			return;
		flags = args.get("typecheck");
		if (flags != null) {
			try {
				tc = new TypeCheckerImplementation(program);
				typechecked = tc.typeCheck();
			} catch (TypeCheckerException e) {
				System.out.println("Type checking failed\n");
				e.printStackTrace();
			}
			if (flags.contains("verbose")) {
				System.out.println("Symbol table:");
				System.out.println(tc.getTable());
			}
		} else 
			return;
		flags = args.get("translate");
		if (flags != null) {
			frags = new TranslateImplementation(architecture, typechecked).translate();
			if (flags.contains("verbose")) {
				StringWriter sout = new StringWriter();
				IndentingWriter out = new IndentingWriter(sout);
				out.println("Fragments:");
				for (Fragment frag : frags) {
					if (frag instanceof ProcFragment) {
						ProcFragment proc = (ProcFragment) frag;
						out.println("MethodFragment {");
						out.indent();
						out.println(proc.getFrame());
						if (flags.contains("raw")) {
							out.println("body:");
							out.println(proc.getBody());
						}
						if (flags.contains("linear")) {
							out.println("linearized:");
							out.println(proc.getLinearizedBody());
						}
						if (flags.contains("basic")) {
							out.println("basic blocks:");
							out.println(proc.getBasicBlocks());
						}
						if (flags.contains("trace")) {
							out.println("trace scheduled:");
							out.println(proc.getTraceScheduledBody());
						}
						out.outdent();
						out.println("}");
					}
				}
				System.out.print(sout.toString());
			}
			if (flags.contains("interpret")) {
				InterpMode mode;
				if (flags.contains("linear")) {
					mode = InterpMode.LINEARIZED_IR;
					System.out.println("Simulating IR code (linear):");
					Interp interp = new Interp(frags, mode);
					String result = runInterp(interp);
					System.out.print(result);
					checkAnswer(result);
				}
				if (flags.contains("basic")) {
					mode = InterpMode.BASIC_BLOCKS;
					System.out.println("Simulating IR code (basic):");
					Interp interp = new Interp(frags, mode);
					String result = runInterp(interp);
					System.out.print(result);
					checkAnswer(result);
				}
				if (flags.contains("trace")) {
					mode = InterpMode.TRACE_SCHEDULE;
					System.out.println("Simulating IR code (trace):");
					Interp interp = new Interp(frags, mode);
					String result = runInterp(interp);
					System.out.print(result);
					checkAnswer(result);
				}
			}
		} else
			return;

		flags = args.get("interpret");
		if (flags != null) {
			System.out.println("Simulating IR code (trace scheduled):");
			InterpMode mode = InterpMode.TRACE_SCHEDULE;

			Interp interp = new Interp(frags, mode);
			String result = runInterp(interp);
			System.out.print(result);
			checkAnswer(result);
		}
		flags = args.get("code");
		if (flags != null) {
			if (flags.contains("verbose"))
				System.out.println("Performing code generation");
			assembly = new CodeGenerator().apply(frags);
			if (flags.contains("verbose")) {
				System.out.print(assembly);
			}
		} else
			return;

		flags = args.get("flow");
		if (flags != null && flags.contains("verbose")) {
			for (AssemFragment frag : assembly) {
				if (frag instanceof AssemProc) {
					AssemProc proc = (AssemProc) frag;
					System.out.println("\n\nFlow graph for : "+proc.getLabel());
					analysis.FlowGraph<Instr> flowGraph = analysis.FlowGraph.build(proc.getBody());
					System.out.println(flowGraph);
				}
			}
		}

		flags = args.get("live");
		if (flags != null && flags.contains("verbose")) {
			for (AssemFragment frag : assembly) {
				if (frag instanceof AssemProc) {
					AssemProc proc = (AssemProc) frag;
					System.out.println("\n\nLiveness information for : "+proc.getLabel());
					analysis.FlowGraph<Instr> flowGraph = analysis.FlowGraph.build(proc.getBody());
					Liveness<Instr> live = new LivenessImplementation<Instr>(flowGraph);
					System.out.println(live);
				}
			}
		}

		flags = args.get("interference");
		if (flags != null && flags.contains("verbose")) {
			for (AssemFragment frag : assembly) {
				if (frag instanceof AssemProc) {
					AssemProc proc = (AssemProc) frag;
					System.out.println("\n\nInterference graph for : "+proc.getLabel());
					analysis.FlowGraph<Instr> flowGraph = analysis.FlowGraph.build(proc.getBody());
					InterferenceGraph interf = flowGraph.getInterferenceGraph();
					System.out.println(interf);
				}
			}
		}

		flags = args.get("register");
		if (flags != null) {
			if (flags.contains("verbose"))
				System.out.println("Doing register allocation");

			for (AssemFragment frag : assembly) {
				if (frag instanceof AssemProc) {
					AssemProc proc = (AssemProc) frag;
					if (flags.contains("verbose"))
						System.out.println("Fragment: "+proc.getLabel());

					RegAlloc alloc = RegAlloc.doit(proc);

					if (flags.contains("veryverbose")) {
						System.out.println(alloc.getTrace());
					} else if (flags.contains("verbose")) {
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
						System.out.println();
						System.out.println("final code for : "+proc.getLabel());
						System.out.println(proc);
					}
				}
			}
		}
		flags = args.get("simulate");
		if (flags != null) {
			String sProgram = assembly.toString();
			if (flags.contains("verbose"))
				System.out.println("Simulating X86_64 code");
			String output = Sim.ulate(sProgram, flags.contains("verbose")).result;
			System.out.println("Program output:\n" + output);
			checkAnswer(output);
		}

		flags = args.get("dots");
		if (flags != null) {
			String assemFileName = Utils.changeSuffix(file, "s");
			assemFile = new File(assemFileName);
			IndentingWriter out = null;
			try {
				out = new IndentingWriter(assemFile);
				assembly.dump(out);
				if (flags.contains("verbose"))
					System.out.println("Wrote to " + assemFileName);
			} catch (IOException e) {
				System.out.println("Can't write assembly code to " + assemFileName);
			}
			finally {
				if (out != null) out.close();
			}
		} else
			return;

		flags = args.get("execute");
		if (flags != null) {
			String result = "";
			try {
				result = new Runner().run(assemFile);
			} catch (IOException e) {
				System.out.println("Bad thing happened while executing program");
				e.printStackTrace();
			}
			checkAnswer(result);
		}
	}
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

	public void go(File file) {
		this.file = file;
		String program = Utils.getContents(file);
		go(program);
	}

	public static void main(String[] args) {
		String program = args[0];
		try {
			new DoItAll(args).go(new File(program));
		} catch (Exception e) {
			System.out.println("Compilation problem");
			e.printStackTrace();
		}
	}
}
