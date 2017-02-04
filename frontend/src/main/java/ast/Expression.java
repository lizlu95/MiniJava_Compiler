package ast;


import org.junit.jupiter.api.Assertions;

public abstract class Expression extends AST {
	
	/**
	 * The type of an expression is set by the type checking phase.
	 */
	private Type type;

	public Type getType() {
		Assertions.assertNotNull(type, "Was this AST typechecked?");
		return type;
	}
	
	public void setType(Type theType) {
		Assertions.assertNull(type);
		type = theType;
	}

}
