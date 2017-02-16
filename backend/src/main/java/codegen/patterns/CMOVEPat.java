package codegen.patterns;

import util.IndentingWriter;
import util.List;
import ir.tree.CMOVE;
import ir.tree.IRExp;
import ir.tree.IRStm;
import ir.tree.CJUMP.RelOp;

public class CMOVEPat extends Pat<IRStm> {

	private Pat<RelOp> op;
	private Pat<IRExp> l;
	private Pat<IRExp> r;
	private Pat<IRExp> d;
	private Pat<IRExp> s;

	public CMOVEPat(Pat<RelOp> op, Pat<IRExp> l, Pat<IRExp> r, Pat<IRExp> d, Pat<IRExp> s) {
		this.op = op; 
		this.l = l;
		this.r = r;
		this.d = d;
		this.s = s;
	}

	@Override
	public void match(IRStm toMatch, Matched matched)
			throws Failed, ClassCastException {
		CMOVE cmove = (CMOVE) toMatch;
		op.match(cmove.getOp(), matched);
		l.match(cmove.getLeft(), matched);
		r.match(cmove.getRight(), matched);
		d.match(cmove.getDst(), matched);
		s.match(cmove.getSrc(), matched);
		//matched.put(this, toMatch);
	}

	@Override
	public void dump(IndentingWriter out) {
		out.print("CMOVE(");
		out.print(op);
		out.print(", ");
		out.print(l);
		out.print(", ");
		out.print(r);
		out.print(", ");
		out.print(d);
		out.print(" <- ");
		out.print(s);
		out.print(")");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pat<IRStm> build(List<Pat<?>> children) {
		return new CMOVEPat( 
				(Pat<RelOp>)children.get(0), 
				(Pat<IRExp>)children.get(1), 	
				(Pat<IRExp>)children.get(2), 	
				(Pat<IRExp>)children.get(3), 	
				(Pat<IRExp>)children.get(4) ); 	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pat<?>> children() {
		return List.list(
				(Pat<?>)op, l, r, d, s );
	}

}
