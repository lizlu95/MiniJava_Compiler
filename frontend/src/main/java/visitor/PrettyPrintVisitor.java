package visitor;

import ast.*;
import util.IndentingWriter;

import java.io.PrintWriter;
import java.io.StringWriter;


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
        if (n.mainClass == null){
         n.statements.accept(this);
         n.print.accept(this);
        }
        else {
            n.mainClass.accept(this);
            n.classes.accept(this);
        }
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
        out.print("System.out.println(");
        n.exp.accept(this);
        out.println(");");
        return null;
    }

    @Override
    public Void visit(Assign n) {
        out.print(n.name + " = ");
        n.value.accept(this);
        out.print(";");
        out.println();
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
        n.receiver.accept(this);
        out.print(".");
        n.name.accept(this);
        out.print("(");
        for (int i = 0; i < n.rands.size(); i++) {
            n.rands.elementAt(i).accept(this);
            if (i + 1 < n.rands.size()) {
                out.print(", ");
            }
        }
        out.print(")");
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
//        out.print("class "+ n.className+ "{ \npublic static void" +
//                "main(String[]　"+ n.argName +")　{\n ");
        out.println("class"+" "+n.className+ "{");
        out.indent();
        out.print("public static void main(String[]");
        out.println(n.argName+") {");
        out.indent();
        n.statement.accept(this);
        out.outdent();
        out.println("}");
        out.outdent();
        out.println("}");
        
        return null;
    }

    @Override
    public Void visit(ClassDecl n) {
        out.print("class "+n.name+" ");
        if(n.superName != null){
            out.print("extends "+ n.superName);
        }
        out.println("{");
        out.indent();
        for(int i = 0;i<n.vars.size(); i++){
            n.vars.elementAt(i).accept(this);
            out.println("; ");
        }
        for(int i = 0;i<n.methods.size(); i++){
            n.methods.elementAt(i).accept(this);
        }
        out.outdent();
        out.println("}");
        
        return null;
    }

    @Override
    public Void visit(MethodDecl n) {
        out.print("public ");
        n.returnType.accept(this);
        out.print(" " + n.name+"(");
        for(int i = 0 ; i < n.formals.size(); i++){
            n.formals.elementAt(i).accept(this);
            if (i + 1 < n.formals.size()) {
                out.print(", ");
            }
        }
        out.println(") {");
        out.indent();
        for(int i = 0;i<n.vars.size(); i++){
            n.vars.elementAt(i).accept(this);
            out.println("; ");
        }
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
    public Void visit(IntArrayType n) {
        out.print("int[]");
        
        return null;
    }

    @Override
    public Void visit(ObjectType n) {
        out.print(n.name);
        
        return null;
    }

    @Override
    public Void visit(Block n) {
        out.println("{");
        out.indent();
        for (int i = 0; i< n.statements.size(); i++){
            n.statements.elementAt(i).accept(this);
        }
        out.outdent();
        out.println("}");
        
        return null;
    }

    @Override
    public Void visit(If n) {
        out.print("if (");
        n.tst.accept(this);
        out.println(")");
        out.indent();
        n.thn.accept(this);
        out.outdent();
        out.println("else");
        out.indent();
        n.els.accept(this);
        out.outdent();
        out.println("");

        
        return null;
    }

    @Override
    public Void visit(While n) {
        out.print("while (");
        n.tst.accept(this);
        out.println(")");
        out.indent();
        n.body.accept(this);
        out.outdent();
        out.println("");
        
        return null;
    }

    @Override
    public Void visit(ArrayAssign n) {
        out.print(n.name+"[");
        n.index.accept(this);
        out.print("] = ");
        n.value.accept(this);
        out.print(";");
        out.println();
        
        return null;
    }

    @Override
    public Void visit(And n) {
        n.e1.accept(this);
        out.print(" && ");
        n.e2.accept(this);
        
        return null;
    }

    @Override
    public Void visit(ArrayLookup n) {
        n.array.accept(this);
        out.print("[");
        n.index.accept(this);
        out.print("]");
        
        return null;
    }

    @Override
    public Void visit(ArrayLength n) {
        n.array.accept(this);
        out.print(".length");
        
        return null;
    }

    @Override
    public Void visit(BooleanLiteral n) {
        if(n.value){
            out.print("true");
        }
        else{
            out.print("false");
        }
        
        return null;
    }

    @Override
    public Void visit(This n) {
        out.print("this");
        
        return null;
    }

    @Override
    public Void visit(NewArray n) {
        out.print("new int[");
        n.size.accept(this);
        out.print("]");
        
        return null;
    }

    @Override
    public Void visit(NewObject n) {
        out.print("new "+n.typeName+"()");
        
        return null;
    }

    @Override
    public Void visit(ClassType classType) {
        out.indent();
        out.println("\nclass fields table: ");
        StringWriter out_inner = new StringWriter();
        classType.fields.dump(new IndentingWriter(out_inner));
        out.println(out_inner);
        out.outdent();
        out.println("class methods table: ");
        out.indent();
        out_inner = new StringWriter();
        classType.methds.dump(new IndentingWriter(out_inner));
        out.println(out_inner.toString());
        out.outdent();
        return null;
    }

    @Override
    public Void visit(MethodType mt) {
        out.println("Method local table: ");
        out.indent();
        StringWriter out_inner = new StringWriter();
        mt.locals.dump(new IndentingWriter(out_inner));
        out.println(out_inner.toString());
        out.outdent();
        out.println("Method param table: ");
        out.indent();
        out_inner = new StringWriter();
        mt.params.dump(new IndentingWriter(out_inner));
        out.println(out_inner.toString());
        out.outdent();
        return null;
    }
}
