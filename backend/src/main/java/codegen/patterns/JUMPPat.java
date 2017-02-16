package codegen.patterns;

import util.IndentingWriter;
import util.List;
import ir.tree.IRExp;
import ir.tree.IRStm;
import ir.tree.JUMP;

public class JUMPPat extends Pat<IRStm> {
	
	private Pat<IRExp> exp;

	public JUMPPat(Pat<IRExp> exp) {
		this.exp = exp;
	}

	@Override
	public void match(IRStm toMatch, Matched m)
			throws Failed, ClassCastException {
		JUMP jump = (JUMP) toMatch;
		exp.match(jump.getExp(), m);
		//m.put(this, toMatch);
	}

	@Override
	public void dump(IndentingWriter out) {
		out.print("JUMP(");
		out.print(exp);
		out.print(")");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pat<IRStm> build(List<Pat<?>> children) {
		return new JUMPPat((Pat<IRExp>)children.get(0));
	}

	@Override
	public List<Pat<?>> children() {
		return List.list(new Pat<?>[] {exp});
	}

}
