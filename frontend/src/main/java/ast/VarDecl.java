package ast;

import visitor.Visitor;


public class VarDecl extends AST {

	public static enum Kind {
		FIELD, LOCAL, FORMAL
	}

	public final Kind   kind;
	public final Type   type;
	public final String name;
	public final int index;

	public VarDecl(Kind kind, Type type, String name, int index) {
		super();
		this.kind = kind;
		this.type = type;
		this.name = name;
		this.index = index;
	}

	public VarDecl(Type type, String name, int index) {
		super();
		this.kind = Kind.FORMAL;
		this.type = type;
		this.name = name;
		this.index = index;
	}

	@Override
	public <R> R accept(Visitor<R> v) {
		return v.visit(this);
	}

}
