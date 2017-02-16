package analysis;
import ir.temp.Color;
import ir.temp.Temp;

import java.util.Map;

import util.DefaultIndentable;
import util.IndentingWriter;
import util.List;

import analysis.util.graph.Graph;
import analysis.util.graph.Node;


abstract public class InterferenceGraph extends Graph<Temp> {
	
	public class Move extends DefaultIndentable {
		
		public Node<Temp> src;
		public Node<Temp> dst;
		public Move(Node<Temp> dst, Node<Temp> src) {
			this.dst = dst;
			this.src = src;
		}
		
		@Override
		public void dump(IndentingWriter out) {
			out.print(dst);
			out.print(" <= ");
			out.print(src);
		}
	}
	
	abstract public List<Move> moves();
	public String name = "Unknown";
	
	/**
	 * This default implementation will work, but you should 
	 * override it to provide a better implementation. 
	 * A good implementation should assign a higher spill cost
	 * to a Temp that is used frequently (and also may reduce
	 * spill cost if a temp interferes with lots of other temps,
	 * because spilling it will help avoid more spills.
	 */
	public double spillCost(Node<Temp> node) {return 1;}
	
	@Override
	protected Node<Temp> makeNode(Temp content) {
		// Create nodes that print nicer.
		return new Node<Temp>(this, content) {
			@Override
			public String toString() {
				return wrappee().toString();
			}
		};
	}

	abstract public String dotString(int K, Map<Temp, Color> xcolorMap);

}
