package codegen.patterns;

import util.IndentingWriter;
import util.List;
import ir.tree.EXP;
import ir.tree.IRExp;
import ir.tree.IRStm;

public class EXPPat extends Pat<IRStm> {

	private Pat<IRExp> exp;

	public EXPPat(Pat<IRExp> exp) {
		this.exp = exp;
	}

	@Override
	public void match(IRStm toMatch, Matched m)
			throws codegen.patterns.Pat.Failed, ClassCastException {
		EXP e = (EXP) toMatch;
		exp.match(e.exp, m);
		//m.put(this, toMatch);
	}

	@Override
	public void dump(IndentingWriter out) {
		out.print("EXP(");
		out.print(exp);
		out.print(")");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pat<IRStm> build(List<Pat<?>> children) {
		return new EXPPat((Pat<IRExp>)children.get(0));
	}

	@Override
	public List<Pat<?>> children() {
		return List.list(new Pat<?>[] {exp});
	}

}
