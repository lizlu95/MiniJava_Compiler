package ast;

import visitor.Visitor;

public class Call extends Expression {

    public final Expression receiver;
    public final Expression name;
    public final NodeList<Expression> rands;

    public Call(Expression receiver, Expression name, NodeList<Expression> rands) {
        super();
        this.receiver = receiver;
        this.name = name;
        this.rands = rands;
    }

    public Call(Expression name, NodeList<Expression> rands) {
        super();
        this.receiver = null;
        this.name = name;
        this.rands = rands;
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }

}
