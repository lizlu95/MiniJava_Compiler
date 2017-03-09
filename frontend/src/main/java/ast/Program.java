package ast;

import visitor.Visitor;

import java.util.List;


public class Program extends AST {

    public final MainClass mainClass;
    public final NodeList<ClassDecl> classes;
    //todo remove the things thats not used
    public final NodeList<AST> statements;
    public final Print print;


    public Program(MainClass mainClass, NodeList<ClassDecl> otherClasses) {
        this.mainClass = mainClass;
        this.classes = otherClasses;
        this.statements = null;
        this.print = null;
    }

    public Program(NodeList<AST> statements, Print print) {
        this.mainClass = null;
        this.classes = null;
        this.statements = statements;
        this.print = print;
    }

    public Program(List<AST> statements, Print print) {
        this(new NodeList<AST>(statements), print);
    }

    public Program(MainClass m, List<ClassDecl> cs) {
        this(m, new NodeList<ClassDecl>(cs));
    }

    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }

}
