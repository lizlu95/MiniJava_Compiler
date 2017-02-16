package visitor;

import ast.*;
import util.IndentingWriter;

import java.io.PrintWriter;


/**
 * This is an adaptation of the PrettyPrintVisitor from the textbook
 * online material, but updated to work with the "modernized"
 * Visitor and our own versions of the AST classes.
 * <p>
 * This version is also cleaned up to actually produce *properly* indented
 * output.
 *
 * @author kdvolder
 */
public class PrettyPrintVisitor implements Visitor<Void> {

    /**
     * Where to send out.print output.
     */
    private IndentingWriter out;

    public PrettyPrintVisitor(PrintWriter out) {
        this.out = new IndentingWriter(out);
    }

    ///////////// Visitor methods /////////////////////////////////////////

    @Override
    public Void visit(Program n) {
        n.statements.accept(this);
        n.print.accept(this);
        return null;
    }

    @Override
    public Void visit(BooleanType n) {
        out.print("boolean");
        return null;
    }

    @Override
    public Void visit(UnknownType n) {
        out.print("unknown");
        return null;
    }

    @Override
    public Void visit(IntegerType n) {
        out.print("int");
        return null;
    }

    @Override
    public Void visit(Conditional n) {
        out.print("( ");
        n.e1.accept(this);
        out.print(" ? ");
        n.e2.accept(this);
        out.print(" : ");
        n.e3.accept(this);
        out.print(" )");
        return null;
    }

    @Override
    public Void visit(Print n) {
        out.print("print ");
        n.exp.accept(this);
        out.println("");
        return null;
    }

    @Override
    public Void visit(Assign n) {
        out.print(n.name + " = ");
        n.value.accept(this);
        out.println(";");
        return null;
    }

    @Override
    public Void visit(LessThan n) {
        out.print("(");
        n.e1.accept(this);
        out.print(" < ");
        n.e2.accept(this);
        out.print(")");
        return null;
    }

    @Override
    public Void visit(Plus n) {
        out.print("(");
        n.e1.accept(this);
        out.print(" + ");
        n.e2.accept(this);
        out.print(")");
        return null;
    }

    @Override
    public Void visit(Minus n) {
        out.print("(");
        n.e1.accept(this);
        out.print(" - ");
        n.e2.accept(this);
        out.print(")");
        return null;
    }

    @Override
    public Void visit(Times n) {
        out.print("(");
        n.e1.accept(this);
        out.print(" * ");
        n.e2.accept(this);
        out.print(")");
        return null;
    }

    @Override
    public Void visit(IntegerLiteral n) {
        out.print("" + n.value);
        return null;
    }

    @Override
    public Void visit(IdentifierExp n) {
        out.print(n.name);
        return null;
    }

    @Override
    public Void visit(Not n) {
        out.print("!");
        n.e.accept(this);
        return null;
    }

    @Override
    public Void visit(FunctionDecl n) {
        n.returnType.accept(this);
        out.print(" " + n.name);
        out.print(" (");
        for (int i = 0; i < n.formals.size(); i++) {
            n.formals.elementAt(i).accept(this);
            if (i + 1 < n.formals.size()) {
                out.print(", ");
            }
        }
        out.println(") { ");
        out.indent();
        for (int i = 0; i < n.statements.size(); i++) {
            n.statements.elementAt(i).accept(this);
        }
        out.print("return ");
        n.returnExp.accept(this);
        out.println(";");
        out.outdent();
        out.println("}");
        return null;
    }

    @Override
    public Void visit(VarDecl n) {
        n.type.accept(this);
        out.print(" " + n.name);
        return null;
    }

    @Override
    public Void visit(FunctionType n) {
        out.print("function (");
        for (int i = 0; i < n.formals.size(); ++i) {
            VarDecl v = n.formals.elementAt(i);
            out.print(v.type/* + " " + v.name*/);
            if (i < n.formals.size() - 1) out.print(", ");
        }
        out.print(") -> ");
        n.returnType.accept(this);
        out.print("\n  locals ");
        out.print(n.locals);
        return null;
    }

    @Override
    public Void visit(Call n) {
        n.name.accept(this);
        out.print("(");
        for (int i = 0; i < n.rands.size(); i++) {
            n.rands.elementAt(i).accept(this);
            if (i + 1 < n.rands.size()) {
                out.print(", ");
            }
        }
        out.println(")");
        return null;
    }

    @Override
    public <T extends AST> Void visit(NodeList<T> nodes) {
        for (int i = 0; i < nodes.size(); i++) {
            nodes.elementAt(i).accept(this);
            out.print("\n");
        }
        return null;
    }

    @Override
    public Void visit(MainClass n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(ClassDecl n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(MethodDecl n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(IntArrayType n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(ObjectType n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(Block n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(If n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(While n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(ArrayAssign n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(And n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(ArrayLookup n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(ArrayLength n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(BooleanLiteral n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(This n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(NewArray n) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Void visit(NewObject n) {
        // TODO Auto-generated method stub
        return null;
    }
}
