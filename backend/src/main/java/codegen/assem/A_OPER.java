package codegen.assem;

import util.List;
import ir.temp.Label;
import ir.temp.Temp;

/**
 * Use this class to represent most instructions, 
 * except MOV temp <- temp 
 * and labels.
 */
public class A_OPER extends Instr {
	public List<Temp> dst;   
	public List<Temp> src;
	public List<Label> jump;

	public A_OPER(String a, List<Temp> d, List<Temp> s, List<Label> j) {
		super(a); 
		dst= d; 
		src= s; 
		jump= j;
	}

	public A_OPER(String a, List<Temp> d, List<Temp> s) {
		this(a, d, s, null);
	}

	@Override
	public List<Temp> use() {return src;}
	@Override
	public List<Temp> def() {return dst;}
	@Override
	public List<Label> jumps() {return jump;}

	@Override
	public Instr clone(List<Temp> oldt, List<Temp> newt) {
		List<Temp> newdst = Instr.translate(dst, oldt, newt);
		List<Temp> newsrc = Instr.translate(src, oldt, newt);
		return new A_OPER(assem, newdst, newsrc, jump);
	}
}
