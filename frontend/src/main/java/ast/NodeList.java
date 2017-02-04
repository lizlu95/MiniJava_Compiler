package ast;

import visitor.Visitor;

import java.util.ArrayList;
import java.util.List;


public class NodeList<T extends AST> extends AST {
	
	private List<T> nodes;

	public NodeList() {
		this.nodes = new ArrayList<T>();
	}

	public NodeList(List<T> nodes) {
		this.nodes = nodes;
	}

	public int size() {
		return nodes.size();
	}

	public void add(T t) {
		this.nodes.add(t);
	}

	public T elementAt(int i) {
		return nodes.get(i);
	}

	@Override
	public <R> R accept(Visitor<R> v) {
		return v.visit(this);
	}

}
