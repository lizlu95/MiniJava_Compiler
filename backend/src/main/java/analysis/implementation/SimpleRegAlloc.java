package analysis.implementation;

import ir.frame.Frame;
import ir.temp.Color;
import ir.temp.Temp;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import util.IndentingWriter;
import util.List;

import codegen.AssemProc;
import codegen.assem.Instr;

import analysis.FlowGraph;
import analysis.InterferenceGraph;
import analysis.RegAlloc;
import analysis.util.graph.Node;

public class SimpleRegAlloc extends RegAlloc {

	private AssemProc proc;
	private String trace = "";
	private FlowGraph<Instr> fg;
	private InterferenceGraph ig;
	private Frame frame;
	private static final boolean generateDotFiles = false;

	private Map<Temp, Color> colorMap = new HashMap<Temp, Color>();
	private List<Temp> registers;
	private List<Color> colors;
	private List<Color> spillColors = List.empty();
	private int iteration;
	static private int incarnation = 0;

	/**
	 * List of *actual* spills.
	 */
	private List<Temp> spilled = List.empty();

	@Override
	public void dump(IndentingWriter out) {
		out.println(trace);
		out.println("Coloring {");
		out.indent();
		for (Temp temp : colorMap.keySet()) {
			out.print(temp);
			out.print(" : ");
			out.println(colorMap.get(temp));
			out.indent();
			for (Node<Temp> interferes : ig.nodeFor(temp).succ()) {
				out.print(interferes);
				out.print(":");
				out.print(getColor(interferes));
				out.print(" ");
			}
			out.println();
			out.outdent();
		}
		out.outdent();
		out.println("}");
		out.print("Spilled");
		out.println(spilled);
	}

	public SimpleRegAlloc(AssemProc proc) {
		this(proc, 1);
	}

	public SimpleRegAlloc(AssemProc proc, int iteration) {
		this.proc = proc;
		this.iteration = iteration;
		this.trace += proc.toString();
		this.frame = proc.getFrame();
		this.registers = frame.registers();

		this.colors = List.empty();
		for (Temp reg : registers) 
			colors.add(reg.getColor());

		build();
		this.trace += "\n" + "Flow graph:\n" + fg.toString();
		this.trace += ig.toString();

		List<Temp> ordering = simplify();

		build(); // must rebuild the graph, since simplify should destroy it.
		color(ordering);
	}

	private void color(List<Temp> toColor) {
		if (toColor.isEmpty()) return;
		Temp t = toColor.head();
		boolean success;

		// Try to color using a register
		success = tryToColor(t, colors);

		if (!success) {
			// Try to spill using an existing spill slot.
			spilled.add(t);
			success = tryToColor(t, spillColors);
		}

		if (!success) {
			//Create a new spill slot and use that.
			SpillColor color = new SpillColor(frame);
			spillColors.add(color);
			setColor(t, color);
		}
		color(toColor.tail());
	}

	private boolean tryToColor(Temp t, List<Color> colors) {
		for (Color color : colors) {
			if (isColorOK(ig.nodeFor(t), color)) {
				setColor(t, color);
				return true;
			}
		}
		return false;
	}

	private boolean isColorOK(Node<Temp> node, Color color) {
		for (Node<Temp> interferes : node.succ()) 
			if (color.equals(getColor(interferes))) return false;
		return true;
	}

	/**
	 * Start by building the interference graph for the procedure body.
	 */
	private void build() {
		this.fg = FlowGraph.build(proc.getBody());
		this.ig = fg.getInterferenceGraph();
		this.ig.name = proc.getLabel().toString() + " round " + iteration;
	}

	/**
	 * Returns a List of Temp's (a stack really) which suggest the order
	 * in which nodes should be assigned colors.
	 * 
	 * This version just returns an arbitrary order.
	 */
	private List<Temp> simplify() {
		List<Node<Temp>> toColor = List.empty();
		List<Temp> ordering = List.empty();
		int simplified = 0;

		// Separate pre-colored nodes from other nodes.
		for (Node<Temp> node : ig.nodes())
			if (!isColored(node)) 
				toColor.add(node);
		
		while (!toColor.isEmpty()) {
			Node<Temp> node = toColor.head();
			toColor = toColor.delete(node);
			ordering = List.cons(node.wrappee(), ordering);
			// this.ig.rmNode(node);
			if (generateDotFiles) {
				File out = new File("simplify-" + incarnation + "-" + simplified + ".dot");
				try {
					PrintStream outb = new PrintStream(out);
					outb.print(ig.dotString(registers.size(), null));
					outb.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			simplified++;
		}
		incarnation++;
		return ordering;
	}

	private boolean isColored(Node<Temp> node) {
		return getColor(node)!=null;
	}

	private Color getColor(Node<Temp> node) {
		return getColor(node.wrappee());
	}

	private void setColor(Temp t, Color color) {
		assert(getColor(t) == null);
		colorMap.put(t, color);
	}

	/**
	 * Gets the color of a Temp based on the "hypothetical" coloring we are
	 * exploring now.
	 */
	private Color getColor(Temp temp) {
		Color color = temp.getColor();
		if (color != null) // it is precolored!
			return color;
		color = colorMap.get(temp);
		return color;
	}

	public List<Temp> getSpilled() {
		return spilled;
	}

	public Map<Temp, Color> getColorMap() {
		return colorMap;
	}

	public String getTrace() {
		return this.toString();
	}
}
