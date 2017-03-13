package typechecker.implementation;

import ast.*;
import typechecker.ErrorReport;
import util.ImpTable;
import util.IndentingWriter;
import util.Pair;
import visitor.Visitor;

import java.io.StringWriter;


/**
 * This class implements Phase 2 of the Type Checker. This phase
 * assumes that we have already constructed the program's symbol table in
 * Phase1.
 * <p>
 * Phase 2 checks for the use of undefined identifiers and type errors.
 * <p>
 * Visitors may return a Type as a result. Generally, only visiting
 * an expression or a type actually returns a type.
 * <p>
 * Visiting other nodes just returns null.
 *
 * @author kdvolder
 */
public class TypeCheckVisitor implements Visitor<Type> {

    /**
     * The place to send error messages to.
     */
    private ErrorReport errors;

    /**
     * The symbol table from Phase 1.
     */
//    private ImpTable<Type> globals;
//    private ImpTable<Type> functions;
//    private ImpTable<Type> thisFunction;
    private final ImpTable<Type> globals = null;
    private final ImpTable<Type> functions = null;
    private final ImpTable<Type> mainTable;
    private final ImpTable<Type> classes;
    private ImpTable<Type> thisFunction;
    private ImpTable<Type> thisFields;
    private ImpTable<Type> thisMethods;
    private ImpTable<Type> thisSuperFields;
    private ImpTable<Type> thisSuperMethods;
    private ImpTable<Type> thisParams;
    private ImpTable<Type> thisLocals;

    // Lookup a name in the two symbol tables that it might be in
    private Type lookup(String name) {
        Type t = null;
        if(thisLocals != null){
            t = thisLocals.lookup(name);
            if(t!= null){
                return t;
            }
        }
        if(thisParams != null){
            t = thisParams.lookup(name);
            if(t!= null){
                return t;
            }
        }
        if(thisFields != null){
            t = thisFields.lookup(name);
            if(t!= null){
                return t;
            }
        }
        if(thisSuperFields != null){
            t = thisSuperFields.lookup(name);
            if(t!= null){
                return t;
            }
        }

        errors.undefinedId(name);
        return t;
    }

    public TypeCheckVisitor(Pair<ImpTable<Type>, ImpTable<Type>> variables, ErrorReport errors) {
        this.mainTable = variables.first;
        this.classes = variables.second;
        this.errors = errors;
    }

    //// Helpers /////////////////////

    /**
     * Check whether the type of a particular expression is as expected.
     */
    private void check(Expression exp, Type expected) {
        Type actual = exp.accept(this);
        System.out.println(actual);
        System.out.println(expected);
        if (!assignableFrom(expected, actual))
            errors.typeError(exp, expected, actual);
    }

    /**
     * Check whether two types in an expression are the same
     */
    private void check(Expression exp, Type t1, Type t2) {
        if (!t1.equals(t2))
            errors.typeError(exp, t1, t2);
    }

    private boolean assignableFrom(Type varType, Type valueType) {
        return varType.equals(valueType);
    }

    private void dumpTable(ImpTable<Type> table){
        System.out.println("====================");
        StringWriter out = new StringWriter();
        table.dump(new IndentingWriter(out));
        System.out.println(out.toString());
        System.out.println("====================");
    }

    ///////// Visitor implementation //////////////////////////////////////

    @Override
    public <T extends AST> Type visit(NodeList<T> ns) {
        for (int i = 0; i < ns.size(); i++) {
            ns.elementAt(i).accept(this);
        }
        return null;
    }

    @Override
    public Type visit(Program n) {
        //		variables = applyInheritance(variables);
        n.mainClass.accept(this);//todo
        n.classes.accept(this);//todo
//        n.statements.accept(this);
//        n.print.accept(this);
        return null;
    }

    @Override
    public Type visit(BooleanType n) {
        return n;
    }

    @Override
    public Type visit(IntegerType n) {
        return n;
    }

    @Override
    public Type visit(UnknownType n) {
        return n;
    }

    /**
     * Can't use check, because print allows either Integer or Boolean types
     */
    @Override
    public Type visit(Print n) {
        /*minijava only prints integer types*/
        check(n.exp,new IntegerType());
        return null;
    }

    @Override
    public Type visit(Assign n) {
        //todo check name is assigned to same type exp or subtype exp
        Type n_type = lookup(n.name.name);
        //look up identifier name, if found
        if(n_type != null){
            //get type of n.value
            Type v_type = n.value.accept(this);
            //if the types are not equal

            if(!assignableFrom(n_type,v_type) && n_type instanceof ObjectType && v_type instanceof ObjectType){
                //cast both to objectType to see if valueType is subclass
                ObjectType ov_type = (ObjectType)v_type;
                ObjectType on_type = (ObjectType)n_type;
                //get v_type's supertype from its ClassType
               ClassType ovc = (ClassType) classes.lookup(ov_type.name);
                //if the class name is invalid or superType not equal identifier Type
                //throw error
               if(ovc==null || on_type.name != ovc.superName){
                   throw new Error("Assign type undefined");
               }

            }
        }
        return null;
    }

    @Override
    public Type visit(LessThan n) {
        check(n.e1, new IntegerType());
        check(n.e2, new IntegerType());
        n.setType(new BooleanType());
        return n.getType();
    }

    @Override
    public Type visit(Conditional n) {
        check(n.e1, new BooleanType());
        Type t2 = n.e2.accept(this);
        Type t3 = n.e3.accept(this);
        check(n, t2, t3);
        return t2;
    }

    @Override
    public Type visit(Plus n) {
        check(n.e1, new IntegerType());
        check(n.e2, new IntegerType());
        n.setType(new IntegerType());
        return n.getType();
    }

    @Override
    public Type visit(Minus n) {
        check(n.e1, new IntegerType());
        check(n.e2, new IntegerType());
        n.setType(new IntegerType());
        return n.getType();
    }

    @Override
    public Type visit(Times n) {
        check(n.e1, new IntegerType());
        check(n.e2, new IntegerType());
        n.setType(new IntegerType());
        return n.getType();
    }

    @Override
    public Type visit(IntegerLiteral n) {
        n.setType(new IntegerType());
        return n.getType();
    }

    @Override
    public Type visit(IdentifierExp n) {
        Type type = lookup(n.name);
        if(type == null){
            errors.undefinedId(n.name);
        }
        return type;
    }

    @Override
    public Type visit(Not n) {
        check(n.e, new BooleanType());
        n.setType(new BooleanType());
        return n.getType();
    }

    @Override
    public Type visit(FunctionDecl n) {
        thisFunction = n.type.locals;
        n.statements.accept(this);
        check(n.returnExp, n.returnType);
        thisFunction = null;
        return null;
    }

    @Override
    public Type visit(VarDecl n) {
        return null;
    }

    @Override
    public Type visit(Call n) {
        // lookup method identifier(n.name) in table
        // get parameterlist
        // get resultType
        //
        //n.receiver has type c, then look up method defination in class C
        Expression e = n.name;
        FunctionType ft = null;
        String functionName = "unknown";
        if (e instanceof IdentifierExp)
            functionName = ((IdentifierExp) e).name;
        Type t = functions.lookup(functionName);
        if (t == null) {
            errors.undefinedId(functionName);
            n.setType(new UnknownType());
        } else if (!(t instanceof FunctionType)) {
            errors.typeError(n, new FunctionType(), t);
            n.setType(new UnknownType());
        } else {
            ft = (FunctionType) t;
            n.setType(ft.returnType);
        }
        // Check number and types of arguments

        if (ft != null) {
            if (n.rands.size() != ft.formals.size()) {
                errors.wrongNumberOfArguments(ft.formals.size(), n.rands.size());
            }
            for (int i = 0; i < n.rands.size(); ++i) {
                if (i < ft.formals.size()) {
                    Expression actual = n.rands.elementAt(i);
                    Type formal = ft.formals.elementAt(i).type;
                    check(actual, formal);
                }
            }
        }
        return n.getType();
    }

    @Override
    public Type visit(FunctionType n) {
        return n;
    }

    @Override
    public Type visit(MainClass n) {
        dumpTable(this.mainTable);
//        throw new Error ("Not implemented");
        n.statement.accept(this);
        return null;
    }

    @Override
    public Type visit(ClassDecl n) {
        throw new Error ("Not implemented");
    }

    @Override
    public Type visit(MethodDecl n) {
        throw new Error ("Not implemented");
    }

    @Override
    public Type visit(IntArrayType n) {
        return n;
    }

    @Override
    public Type visit(ObjectType n) {
        return n;
    }

    @Override
    public Type visit(Block n) {
        n.statements.accept(this);
        return null;
    }

    @Override
    public Type visit(If n) {
        check(n.tst,new BooleanType());
        n.thn.accept(this);
        n.els.accept(this);
        return null;
    }

    @Override
    public Type visit(While n) {
        check(n.tst,new BooleanType());
        n.body.accept(this);
        return null;
    }

    @Override
    public Type visit(ArrayAssign n) {
        Type tn = lookup(n.name);
        if (tn != null){
            Type tv = n.value.accept(this);
            check(n.value,tn,tv);
        }
        check(n.index, new IntegerType());
        return null;
    }

    @Override
    public Type visit(And n) {
        check(n.e1, new BooleanType());
        check(n.e2, new BooleanType());
        n.setType(new BooleanType());
        return n.getType();
    }

    @Override
    public Type visit(ArrayLookup n) {

        return null;
    }

    @Override
    public Type visit(ArrayLength n) {
        check(n.array,new IntArrayType());
        n.setType(new IntArrayType());
        return n.getType();
    }

    @Override
    public Type visit(BooleanLiteral n) {
        n.setType(new BooleanType());
        return n.getType();
    }

    @Override
    public Type visit(This n) {
        //TODO need to somehow get the name of "this" class
        n.setType(new ObjectType("a"));
        return n.getType();
    }

    @Override
    public Type visit(NewArray n) {
        check(n.size,new IntegerType());
        n.setType(new IntArrayType());
        return n.getType();
    }

    @Override
    public Type visit(NewObject n) {
        //TODO check if this object type n.typeName exsits in table as a class
        n.setType(new ObjectType(n.typeName));
        return n.getType();
    }

    @Override
    public Type visit(ClassType classType) {
        return null;
    }

    @Override
    public Type visit(MethodType methodType) {
        return null;
    }
}
