package visitor;

import ast.*;

/**
 * A modernized version of the Visitor interface, adapted from the textbook's
 * version.
 * <p>
 * Changes: this visitor allows you to return something as a result.
 * The "something" can be of any particular type, so the Visitor
 * uses Java generics to express this.
 *
 * @author kdvolder
 */
public interface Visitor<R> {

    //Lists
    public <T extends AST> R visit(NodeList<T> ns);

    //Declarations
    public R visit(Program n);

    public R visit(MainClass n);

    public R visit(ClassDecl n);

    public R visit(VarDecl n);

    public R visit(MethodDecl n);

    public R visit(FunctionDecl n);

    //Types
    public R visit(IntArrayType n);

    public R visit(BooleanType n);

    public R visit(IntegerType n);

    public R visit(ObjectType n);

    public R visit(UnknownType n);

    public R visit(FunctionType n);

    //Statements
    public R visit(Block n);

    public R visit(If n);

    public R visit(While n);

    public R visit(Print n);

    public R visit(Assign n);

    public R visit(ArrayAssign n);

    //Expressions
    public R visit(And n);

    public R visit(LessThan n);

    public R visit(Plus n);

    public R visit(Minus n);

    public R visit(Times n);

    public R visit(ArrayLookup n);

    public R visit(ArrayLength n);

    public R visit(Call n);

    public R visit(IntegerLiteral n);

    public R visit(BooleanLiteral n);

    public R visit(IdentifierExp n);

    public R visit(This n);

    public R visit(NewArray n);

    public R visit(NewObject n);

    public R visit(Not not);

    public R visit(Conditional n);
    //todo
    public R visit(ClassType classType);
    //todo
    public R visit(MethodType methodType);
}
