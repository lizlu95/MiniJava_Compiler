package analysis.implementation;

import ir.temp.Label;
import ir.temp.Temp;

import java.util.HashMap;
import java.util.Map;

import util.List;

import codegen.assem.A_LABEL;
import codegen.assem.A_MOVE;
import codegen.assem.Instr;

import analysis.FlowGraph;
import analysis.InterferenceGraph;
import analysis.util.graph.Node;


public class AssemFlowGraph extends FlowGraph<Instr> {
	
	/**
	 * Build the flow graph for a given list of assembly instructions.
	 */
	public AssemFlowGraph(List<Instr> body) {
		//We'll do this in two passes. 
		
		// Info build up and remembered during pass 1:
		Map<Label, Node<Instr>> labelMap = new HashMap<Label, Node<Instr>>();
		List<Node<Instr>> jumpNodes = List.empty();
		
		// Pass 1) 
		//   - Create all the nodes.
		//   - Make an edge from each non-jump node to the next node.
		//   !! Does not deal with JUMP node edges !!
		
		Node<Instr> previousNode = null;
		for (Instr instr : body) {
			Node<Instr> currentNode = newNode(instr);
			if (instr instanceof A_LABEL) 
				labelMap.put( ((A_LABEL)instr).getLabel(), currentNode );
			if (previousNode != null) 
				addEdge(previousNode, currentNode);
			List<Label> targets = instr.jumps();
			if (targets == null) { // Non-jump node
				previousNode = currentNode;
			}
			else { // jump node
				jumpNodes.add(currentNode);
				previousNode = null;
			}
		}
		
		// Pass 2) 
		//   - Revisit all JUMP nodes and add their edges
		for (Node<Instr> node : jumpNodes) {
			List<Label> targets = instr(node).jumps();
			for (Label jumpTo : targets) {
				addEdge(node, labelMap.get(jumpTo));
			}
		}
	}


	private Instr instr(Node<Instr> node) {
		return node.wrappee();
	}
	
	@Override
	public List<Temp> def(Node<Instr> node) {
		return instr(node).def();
	}

	@Override
	public boolean isMove(Node<Instr> node) {
		return instr(node) instanceof A_MOVE;
	}

	@Override
	public List<Temp> use(Node<Instr> node) {
		return instr(node).use();
	}


	@Override
	public InterferenceGraph getInterferenceGraph() {
		return new InterferenceGraphImplementation<Instr>(this);
	}

	private String dotLabel(Node<Instr> n) {
		final boolean includeTemps = false;
		StringBuffer sb = new StringBuffer();
		sb.append(n); sb.append(": "); sb.append(n.wrappee()); 
		if (includeTemps) {
			sb.append("\\n");
			for(Temp temp : def(n)) {
				sb.append(temp.toString());
				sb.append(" ");
			}
			sb.append(isMove(n) ? "<= " : "<- ");
			for(Temp temp : use(n)) {
				sb.append(temp);
				sb.append(" ");
			}
		}
		return sb.toString();
	}

	private double fontSize() {
		return (Math.max(30, Math.sqrt(Math.sqrt(nodes().size() + 1)) * nodes().size() * 1.2));
	}

	private double lineWidth() {
		return (Math.max(3.0, Math.sqrt(nodes().size() + 1) * 1.4));
	}
	private double arrowSize() {
		return Math.max(2.0, Math.sqrt(Math.sqrt(nodes().size() + 1)));
	}
	@Override
	public String dotString(String name) {
		StringBuffer out = new StringBuffer();
		out.append("digraph \"Flow graph\" {\n");
		out.append("labelloc=\"t\";\n");
		out.append("fontsize=" + fontSize() + ";\n");
		out.append("label=\"" + name + "\";\n");

		out.append("  graph [size=\"6.5, 9\", ratio=fill];\n");
		for (Node<Instr> n : nodes()) {
			out.append("  \"" + dotLabel(n) + "\" [fontsize=" + fontSize());
			out.append(", style=\"setlinewidth(" + lineWidth() + ")\", color=" + (isMove(n) ? "green" : "blue"));
			out.append("]\n");
		}
		for (Node<Instr> n : nodes()) {
			for (Node<Instr> o : n.succ()) {
				out.append("  \"" + dotLabel(n) + "\" -> \"" + dotLabel(o) + "\" [arrowhead = normal, arrowsize=" + arrowSize() + ", style=\"setlinewidth(" + lineWidth() + ")\"];\n");
			}
		}

		out.append("}\n");
		return out.toString();
	}

}
