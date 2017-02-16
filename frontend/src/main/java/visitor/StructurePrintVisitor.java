package visitor;

import ast.*;
import util.IndentingWriter;

import java.io.PrintWriter;


/**
 * This prints the structure of an AST, showing its hierarchical relationships.
 * <p>
 * This version is also cleaned up to actually produce *properly* indented
 * output.
 *
 * @author norm
 */
public class StructurePrintVisitor implements Visitor<Void> {

    /**
     * Where to send out.print output.
     */
    private IndentingWriter out;

    public StructurePrintVisitor(PrintWriter out) {
        this.out = new IndentingWriter(out);
    }

    ///////////// Visitor methods /////////////////////////////////////////

    @Override
    public Void visit(Program n) {
        out.println("Program");
        out.indent();
        n.statements.accept(this);
        n.print.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(BooleanType n) {
        out.println("BooleanType");
        return null;
    }

    @Override
    public Void visit(UnknownType n) {
        out.println("UnknownType");
        return null;
    }

    @Override
    public Void visit(IntegerType n) {
        out.println("IntegerType");
        return null;
    }

    @Override
    public Void visit(Conditional n) {
        out.println("Conditional");
        out.indent();
        n.e1.accept(this);
        n.e2.accept(this);
        n.e3.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(Print n) {
        out.println("Print");
        out.indent();
        n.exp.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(Assign n) {
        out.println("Assign");
        out.indent();
        n.name.accept(this);
        n.value.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(LessThan n) {
        out.println("LessThan");
        out.indent();
        n.e1.accept(this);
        n.e2.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(Plus n) {
        out.println("Plus");
        out.indent();
        n.e1.accept(this);
        n.e2.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(Minus n) {
        out.println("Minus");
        out.indent();
        n.e1.accept(this);
        n.e2.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(Times n) {
        out.println("Times");
        out.indent();
        n.e1.accept(this);
        n.e2.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(IntegerLiteral n) {
        out.println("IntegerLiteral " + n.value);
        return null;
    }

    @Override
    public Void visit(IdentifierExp n) {
        out.println("IdentifierExp " + n.name);
        return null;
    }

    @Override
    public Void visit(Not n) {
        out.println("Not");
        out.indent();
        n.e.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(FunctionDecl n) {
        out.println("FunctionDecl");
        out.indent();
        n.returnType.accept(this);
        new IdentifierExp(n.name).accept(this);
        n.formals.accept(this);
        n.statements.accept(this);
        n.returnExp.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(VarDecl n) {
        out.println("VarDecl");
        out.indent();
        n.type.accept(this);
        new IdentifierExp(n.name).accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(FunctionType n) {
        out.println("FunctionType");
        out.indent();
        n.formals.accept(this);
        n.returnType.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public Void visit(Call n) {
        out.println("Call");
        out.indent();
        n.name.accept(this);
        n.rands.accept(this);
        out.outdent();
        return null;
    }

    @Override
    public <T extends AST> Void visit(NodeList<T> nodes) {
        for (int i = 0; i < nodes.size(); i++) {
            nodes.elementAt(i).accept(this);
        }
        return null;
    }

    @Override
    public Void visit(MainClass n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(ClassDecl n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(MethodDecl n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(IntArrayType n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(ObjectType n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(Block n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(If n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(While n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(ArrayAssign n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(And n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(ArrayLookup n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(ArrayLength n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(BooleanLiteral n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(This n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(NewArray n) {
        throw new Error("Not implemented");
    }

    @Override
    public Void visit(NewObject n) {
        throw new Error("Not implemented");
    }
}
