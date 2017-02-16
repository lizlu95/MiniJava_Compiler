package codegen.patterns;

import util.IndentingWriter;
import util.List;
import ir.temp.Label;
import ir.tree.IRStm;
import ir.tree.LABEL;

public class LABELPat extends Pat<IRStm> {

	private Pat<Label> l;

	public LABELPat(Pat<Label> l) {
		this.l = l;
	}

	@Override
	public void match(IRStm toMatch, Matched matched)
			throws Failed, ClassCastException {
		LABEL label = (LABEL) toMatch;
		l.match(label.getLabel(), matched);
		//matched.put(this, toMatch);
	}

	@Override
	public void dump(IndentingWriter out) {
		out.print("LABEL(");
		out.print(l);
		out.print(")");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pat<IRStm> build(List<Pat<?>> children) {
		return new LABELPat((Pat<Label>)children.get(0));
	}

	@Override
	public List<Pat<?>> children() {
		return List.list(new Pat<?>[] {l});
	}

}
