package codegen.patterns;

import util.IndentingWriter;
import util.List;
import ir.temp.Color;
import ir.temp.Temp;
import ir.tree.IRExp;
import ir.tree.TEMP;

/**
 * A pattern that matches TEMP(...), but *only* if the Temp is either
 * not colored, or is colored with a register color (in other words, only
 * "real" Temp's are considered, not Temps which have been spilled.
 * <p>
 * Special rules/patterns should be defined to handle spilled Temps.
 * <p>
 * Note: one possible/good way to deal with handling spilled might be
 * to extend the MEM pattern to be able to match spilled TEMPs.
 * <p>
 * Note: until we implement register allocation, there will never be
 * spilled Temps, so the above described special cases can not occur 
 * until the register allocation phase.
 * 
 * @author kdvolder
 */
public class TEMPPat extends Pat<IRExp> {

	private Pat<Temp> t;

	public TEMPPat(Pat<Temp> t) {
		this.t = t;
	}

	@Override
	public void match(IRExp toMatch, Matched matched)
			throws Failed {
		TEMP temp = (TEMP) toMatch;
		
		Color color = temp.getColor();
		if (color!=null && !temp.getColor().isRegister())
			fail();
		
		t.match(temp.temp, matched);
		//matched.put(this, toMatch);
	}

	@Override
	public void dump(IndentingWriter out) {
		out.print("TEMP(");
		out.print(t);
		out.print(")");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pat<IRExp> build(List<Pat<?>> children) {
		return new TEMPPat((Pat<Temp>) children.get(0));
	}

	@Override
	public List<Pat<?>> children() {
		return List.list(new Pat<?>[] {t});
	}

}
