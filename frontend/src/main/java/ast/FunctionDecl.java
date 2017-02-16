package ast;

import visitor.Visitor;

import java.util.List;


public class FunctionDecl extends AST {

    public final Type returnType;
    public final String name;
    public final NodeList<VarDecl> formals;
    public final NodeList<Statement> statements;
    public final Expression returnExp;
    public FunctionType type;

    public FunctionDecl(Type returnType, String name, NodeList<VarDecl> formals,
                        NodeList<Statement> statements, Expression returnExp) {
        super();
        this.returnType = returnType;
        this.name = name;
        this.formals = formals;
        this.statements = statements;
        this.returnExp = returnExp;
    }

    public FunctionDecl(Type returnType, String name, List<VarDecl> formals,
                        List<Statement> statements, Expression returnExp) {
        this(
                returnType, name, new NodeList<VarDecl>(formals),
                new NodeList<Statement>(statements),
                returnExp
        );
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }

}
