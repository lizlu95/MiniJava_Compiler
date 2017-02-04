package ast;

import util.ImpTable;
import visitor.Visitor;

public class FunctionType extends Type {
	public Type returnType;
	public NodeList<VarDecl> formals;
	public ImpTable<Type> locals = new ImpTable<Type>();
	
	@Override
	public <R> R accept(Visitor<R> v) {
		return v.visit(this);
	}
	
	@Override
	public boolean equals(Object other) {
		return this.getClass()==other.getClass();
	}
}
