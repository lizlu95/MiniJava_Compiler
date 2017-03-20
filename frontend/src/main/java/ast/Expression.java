package ast;


public abstract class Expression extends AST {

    /**
     * The type of an expression is set by the type checking phase.
     */
    private Type type;

    public Type getType() {
        assert (type != null) :
                "Was this AST typechecked?";
        return type;
    }

    public void setType(Type theType) {
        assert (type == null);
        type = theType;
    }

    public boolean typed() {
        return type!=null;
    }

}
