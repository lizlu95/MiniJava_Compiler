package ast;

import visitor.Visitor;

public class Conditional extends Expression {

	public final Expression e1;
	public final Expression e2;
	public final Expression e3;

	public Conditional(Expression e1, Expression e2, Expression e3) {
		super();
		this.e1 = e1;
		this.e2 = e2;
		this.e3 = e3;
	}

	@Override
	public <R> R accept(Visitor<R> v) {
		return v.visit(this);
	}

}
