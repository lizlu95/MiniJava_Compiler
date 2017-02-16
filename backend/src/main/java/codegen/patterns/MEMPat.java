package codegen.patterns;

import util.IndentingWriter;
import util.List;
import ir.tree.IRExp;
import ir.tree.MEM;

public class MEMPat extends Pat<IRExp> {

	private Pat<IRExp> exp;

	public MEMPat(Pat<IRExp> exp) {
		this.exp = exp;
	}

	@Override
	public void match(IRExp toMatch, Matched m)
			throws Failed, ClassCastException {
		MEM mem = (MEM) toMatch;
		exp.match(mem.exp, m);
		//m.put(this, toMatch);
	}

	@Override
	public void dump(IndentingWriter out) {
		out.print("MEM(");
		out.print(exp);
		out.print(")");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pat<IRExp> build(List<Pat<?>> children) {
		return new MEMPat((Pat<IRExp>) children.get(0));
	}

	@Override
	public List<Pat<?>> children() {
		return List.list(new Pat<?>[] {exp});
	}

}
