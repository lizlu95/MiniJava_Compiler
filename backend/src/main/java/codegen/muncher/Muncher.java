package codegen.muncher;

import util.DefaultIndentable;
import util.IndentingWriter;
import util.List;
import ir.frame.Frame;
import ir.temp.Temp;
import ir.tree.IRExp;
import ir.tree.IRStm;
import codegen.assem.Instr;

public abstract class Muncher extends DefaultIndentable {

	/**
	 * Accumulates a list of instructions produced by emit.
	 */
	private List<Instr> instructions = List.empty();
	private boolean doTrace = false;

	private MuncherRules<IRStm, Void> stmMunchers;
	private MuncherRules<IRExp, Temp> expMunchers;
	private MuncherRules<IRExp, Void> dataMunchers;

	private long nesting = 0;
	private Frame frame;

	public void trace(String s) {
		if (!doTrace) return;
		for (int i = 0; i < nesting - 1; ++i) 
			System.out.print("    ");
		System.out.println(s);
	}

	protected Muncher(Frame frame, MuncherRules<IRStm, Void> stmMunchers, 
			MuncherRules<IRExp, Temp> expMunchers, 
			MuncherRules<IRExp, Void> dataMunchers, 
			boolean doTrace) {
		this.frame = frame;
		this.stmMunchers = stmMunchers;
		this.expMunchers = expMunchers;
		this.dataMunchers = dataMunchers;
		this.doTrace = doTrace;
		if (doTrace)
			System.out.println("Munching fragment: " + frame.getLabel());
	}

	protected Muncher(Frame frame, MuncherRules<IRStm, Void> stmMunchers, 
			MuncherRules<IRExp, Temp> expMunchers, 
			MuncherRules<IRExp, Void> dataMunchers) {
		this(frame, stmMunchers, expMunchers, dataMunchers, false);
	}

	protected Muncher(Frame frame, MuncherRules<IRStm, Void> stmMunchers, MuncherRules<IRExp, Temp> expMunchers, boolean doTrace) {
		this.frame = frame;
		this.stmMunchers = stmMunchers;
		this.expMunchers = expMunchers;
		this.doTrace = doTrace;
		if (doTrace)
			System.out.println("Munching fragment: " + frame.getLabel());
	}

	protected Muncher(Frame frame, MuncherRules<IRStm, Void> stmMunchers, MuncherRules<IRExp, Temp> expMunchers) {
		this(frame, stmMunchers, expMunchers, false);
	}

	/**
	 * Add an instruction to the code. The new instruction is added to the
	 * end of the list.
	 */
	public void emit(Instr instr) {
		instructions.add(instr);
		trace("Emitting " + instr);
	}

	/**
	 * Munch the statement, adding instructions to this muncher's list of instructions
	 * as a side effect.
	 * <p>
	 * The implementation of this method should call "emit" to add instructions.
	 */
	public void munch(IRStm stm) {
		nesting ++;
		stmMunchers.munch(this, stm);
		nesting --;
	}

	/**
	 * Like munch(IStm) but munches an IRExp. 
	 */
	public Temp munch(IRExp exp) {
		nesting ++;
		Temp t = expMunchers.munch(this, exp);
		nesting --;
		return t;
	}

 	/**
	 * Like munch(IRExp) but munches an IRExp to static data. 
	 */
	public void munchData(IRExp exp) {
		nesting ++;
		dataMunchers.munch(this, exp);
		nesting --;
	}

	/**
	 * After the munching is complete, retrieve the accumulated instructions with this
	 * method.
	 */
	public List<Instr> getInstructions() {
		return instructions;
	}

	@Override
	public void dump(IndentingWriter out) {
		out.println("Muncher {");
		out.indent();

		out.print("stm ");
		out.println(stmMunchers);
		out.print("exp ");
		out.println(expMunchers);

		out.outdent();
		out.print("}");
	}

	public Frame getFrame() {
		return frame;
	}

}