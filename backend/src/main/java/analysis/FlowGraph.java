package analysis;

import util.IndentingWriter;
import util.List;
import ir.temp.Temp;
import codegen.assem.Instr;
import analysis.implementation.AssemFlowGraph;
import analysis.util.graph.Graph;
import analysis.util.graph.Node;

/**
 * A control flow graph is a directed graph in which each edge
 * indicates a possible flow of control.  Also, each node in
 * the graph defines a set of temporaries; each node uses a set of
 * temporaries; and each node is, or is not, a <strong>move</strong>
 * instruction.
 *
 * @see AssemFlowGraph
 */

public abstract class FlowGraph<N> extends Graph<N> {

	/**
	 * Determines what column the Assem instructions will be printed at.
	 */
	private static final int TAB_STOP = 50;

	/**
	 * The set of temporaries defined by this instruction or block 
	 */
	public abstract List<Temp> def(Node<N> node);

	/**
	 * The set of temporaries used by this instruction or block 
	 */
	public abstract List<Temp> use(Node<N> node);

	/**
	 * True if this node represents a <strong>move</strong> instruction,
	 * i.e., one that can be deleted if def=use. 
	 */
	public abstract boolean isMove(Node<N> node);

	/**
	 * Print a human-readable dump for debugging.
	 */
	@Override
	public void dump(IndentingWriter out) {
		for (Node<N> n : nodes()) {
			out.print(n.toString());
			out.print(": ");
			for(Temp temp : def(n)) {
				out.print(temp.toString());
				out.print(" ");
			}
			out.print(isMove(n) ? "<= " : "<- ");
			for(Temp temp : use(n)) {
				out.print(temp);
				out.print(" ");
			}
			out.print("; goto ");
			for(Node<N> succ : n.succ()) {
				out.print(succ);
				out.print(" ");
			}
			out.tabTo(TAB_STOP); out.print(n.wrappee());
			out.println();
		}
	}

	/**
	 *Get the interference graph constructed from this flow graph.
	 */
	public abstract InterferenceGraph getInterferenceGraph();

	/**
	 * Build a flowgraph with a concrete implementation of the class.
	 */
	public static FlowGraph<Instr> build(List<Instr> body) {
		return new AssemFlowGraph(body);
	}

	public abstract String dotString(String name) ;
}

