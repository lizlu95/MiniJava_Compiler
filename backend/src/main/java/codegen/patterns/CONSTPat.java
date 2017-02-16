package codegen.patterns;

import util.IndentingWriter;
import util.List;
import ir.tree.CONST;
import ir.tree.IRExp;

public class CONSTPat extends Pat<IRExp> {

	private Pat<Integer> value;

	public CONSTPat(Pat<Integer> value) {
		this.value = value;
	}

	@Override
	public void match(IRExp toMatch, Matched matched)
			throws Failed, ClassCastException {
		CONST cnst = (CONST) toMatch;
		value.match(cnst.getValue(), matched);
	}

	@Override
	public void dump(IndentingWriter out) {
		out.print("CONST(");
		out.print(value);
		out.print(")");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pat<IRExp> build(List<Pat<?>> children) {
		return new CONSTPat((Pat<Integer>)children.get(0));
	}

	@Override
	public List<Pat<?>> children() {
		return List.list(new Pat<?>[]{value});
	}

}
