package analysis.implementation;

import ir.temp.Temp;

import java.util.Collections;
import java.util.HashMap;

import util.List;

import analysis.FlowGraph;
import analysis.Liveness;
import analysis.util.ActiveSet;
import analysis.util.graph.Node;


public class LivenessImplementation<N> extends Liveness<N> {
	
	public LivenessImplementation(FlowGraph<N> graph) {
		super(graph);
	}

	@Override
	public List<Temp> liveOut(Node<N> node) {
		// This dummy implementation says that nothing is live
		return List.empty();
	}

	private List<Temp> liveIn(Node<N> node) {
		// This dummy implementation says that nothing is live
		return List.empty();
	}

	private String shortList(List<Temp> l) {
		java.util.List<String> reall = new java.util.ArrayList<String>();
		for (Temp t : l) {
			reall.add(t.toString());
		}
		Collections.sort(reall);
		StringBuffer sb = new StringBuffer();
		sb.append(reall);
		return sb.toString();
	}
	
	private String dotLabel(Node<N> n) {
		StringBuffer sb = new StringBuffer();
		sb.append(shortList(liveIn(n))); sb.append("\\n"); 
		sb.append(n); sb.append(": "); sb.append(n.wrappee()); sb.append("\\n");
		sb.append(shortList(liveOut(n))); 
		return sb.toString();
	}

	private double fontSize() {
		return (Math.max(30, Math.sqrt(Math.sqrt(g.nodes().size() + 1)) * g.nodes().size() * 1.2));
	}

	private double lineWidth() {
		return (Math.max(3.0, Math.sqrt(g.nodes().size() + 1) * 1.4));
	}
	private double arrowSize() {
		return Math.max(2.0, Math.sqrt(Math.sqrt(g.nodes().size() + 1)));
	}
	@Override
	public String dotString(String name) {
		StringBuffer out = new StringBuffer();
		out.append("digraph \"Flow graph\" {\n");
		out.append("labelloc=\"t\";\n");
		out.append("fontsize=" + fontSize() + ";\n");
		out.append("label=\"" + name + "\";\n");

		out.append("  graph [size=\"6.5, 9\", ratio=fill];\n");
		for (Node<N> n : g.nodes()) {
			out.append("  \"" + dotLabel(n) + "\" [fontsize=" + fontSize());
			out.append(", style=\"setlinewidth(" + lineWidth() + ")\", color=" + (g.isMove(n) ? "green" : "blue"));
			out.append("]\n");
		}
		for (Node<N> n : g.nodes()) {
			for (Node<N> o : n.succ()) {
				out.append("  \"" + dotLabel(n) + "\" -> \"" + dotLabel(o) + "\" [arrowhead = normal, arrowsize=" + arrowSize() + ", style=\"setlinewidth(" + lineWidth() + ")\"];\n");
			}
		}

		out.append("}\n");
		return out.toString();
	}

}
