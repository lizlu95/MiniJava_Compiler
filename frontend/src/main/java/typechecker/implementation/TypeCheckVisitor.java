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
    private String mainClassArgsName;
    private String currClass;

    public TypeCheckVisitor(Pair<ImpTable<Type>, ImpTable<Type>> variables, ErrorReport errors) {
        this.mainTable = variables.first;
        this.classes = variables.second;
        this.errors = errors;
    }

    //// Helpers /////////////////////

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

    private Type lookupmore(String var, String cls){
        Type t = lookup(var);
        ClassType ct = (ClassType) classes.lookup(cls);
        if(t!=null) return t;
        else if(ct!=null) {
            String ctsuper = ct.superName;
            ClassType cts = (ClassType) classes.lookup(ctsuper);
            t = cts.fields.lookup(var);
            if(t!=null) return t;
            else return lookupmore(var,ctsuper);
        } else return null;
    }


    /**
     * Check whether the type of a particular expression is as expected.
     */
    private void check(Expression exp, Type expected) {
        Type actual = exp.accept(this);
        System.out.println(actual);
        System.out.println(expected);
        if (actual == null){
            errors.errorsInExpression(exp);
        }
        else if (!assignableFrom(expected, actual))
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
        if (varType == null || valueType == null) {
            errors.assignableFromError(varType,valueType);
        }
        else {
            return varType.equals(valueType);
        }
        return false; //placeholder by this time it will be an error in errors and therefore error will be thrown instead
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
        System.out.println("I'm in Assign, trying to find the variable: "+n.name);
        //special case with MainClass
        if (this.mainClassArgsName != null){
            if (n.name.equals(this.mainClassArgsName)){
                errors.cannotUseArgsInMain();
            }
        }
        //todo check name is assigned to same type exp or subtype exp
        Type n_type = lookup(n.name.name);
        System.out.println("Type of above is: "+n_type);
        //look up identifier name, if found
        if(n_type != null){
            //get type of n.value
            Type v_type = n.value.accept(this);
            //if the types are not equal

            if(!assignableFrom(n_type,v_type) &&
                    n_type instanceof ObjectType &&
                    v_type instanceof ObjectType){
                //cast both to objectType to see if valueType is subclass
                ObjectType ov_type = (ObjectType)v_type;
                ObjectType on_type = (ObjectType)n_type;
                //get v_type's supertype from its ClassType
               ClassType ovc = (ClassType) classes.lookup(ov_type.name);
                //if the class name is invalid or superType not equal identifier Type
                //throw error
               if(ovc==null){
                   errors.undefinedId(n.name.name);
               } else if (on_type.name != ovc.superName) {
                   errors.typeError(n.name,n_type,v_type);
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
        //special case with MainClass
        if (this.mainClassArgsName != null){
//            System.out.println("visiting IdentifierExp: "+n.name);
            if (n.name.equals(this.mainClassArgsName)){
//                System.out.println("throwing error now");
                errors.cannotUseArgsInMain();
                return null;
            }
        }
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
        Expression name = n.name;
        Expression recv = n.receiver;
        MethodType mt = null;
        String methodName = "unknown";
        String className = "unknown";
        if (!(name instanceof IdentifierExp)) {
            errors.errorsInExpression(name);
            n.setType(new UnknownType());
        }
        methodName = ((IdentifierExp) name).name;
        ObjectType recob = (ObjectType) recv.accept(this);
        className = recob.name;
        //lookup classType from classes with className
        ClassType ct = (ClassType) classes.lookup(className);
        if(ct == null){
            errors.undefinedId(className);
        }
        MethodType mtd = (MethodType) ct.methds.lookup(methodName);
        if(mtd == null){
            errors.undefinedId(methodName);
        }

        n.setType(mtd.returnType);

        // check formal numbers and formal types
        if (n.rands.size() != mtd.formals.size()) {
            errors.wrongNumberOfArguments(mtd.formals.size(), n.rands.size());
        }
        for (int i = 0; i < n.rands.size(); ++i) {
            if (i < mtd.formals.size()) {
                Expression actual = n.rands.elementAt(i);
                Type formal = mtd.formals.elementAt(i).type;
                check(actual, formal);
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
//        dumpTable(this.mainTable);
        this.mainClassArgsName = n.argName;
        n.statement.accept(this);
        this.mainClassArgsName = null;
        return null;
    }

    @Override
    public Type visit(ClassDecl n) {
        dumpTable(this.classes);
        currClass = n.name;
        this.thisFields = n.type.fields;
        this.thisMethods = n.type.methds;
        n.vars.accept(this);
        n.methods.accept(this);
        this.thisFields = null;
        this.thisMethods = null;
        currClass = null;
        return null;
    }

    @Override
    public Type visit(MethodDecl n) {
        this.thisParams = n.type.params;
        this.thisLocals = n.type.locals;
        n.formals.accept(this);
        n.vars.accept(this);
        n.statements.accept(this);
        check(n.returnExp,n.returnType);
        this.thisParams = null;
        this.thisLocals = null;
        return null;
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
        //special case with MainClass
        System.out.println("special case: "+this.mainClassArgsName + " "+n.name);
        if (this.mainClassArgsName != null){
            if (n.name.equals(this.mainClassArgsName)){
                System.out.println("throwing error!");
                errors.cannotUseArgsInMain();
            }
        }
//        System.out.println("in ArrayAssign trying to assign to variable: "+n.name);
        Type tn = lookup(n.name);
        System.out.println("Found variable type to be: "+tn);
        if (! assignableFrom(tn,new IntArrayType())){
            errors.typeError(n.name,new IntArrayType(),tn);
        }
        Type tv = n.value.accept(this);
//        System.out.println("Found value type to be: "+tv);
        if (! assignableFrom(tv,new IntegerType())){
            errors.typeError(n.value,new IntegerType(),tv);
        }
//        System.out.println("finished checking n.value type");
//        check(n.index, new IntegerType());
        Type ti = n.index.accept(this);
        if (! assignableFrom(ti,new IntegerType())){
            errors.typeError(n.index,new IntegerType(),ti);
        }
//        System.out.println("finished array assign");
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
        System.out.println("In ArrayLookup: "+n.array);
        if(n.array instanceof IdentifierExp){
            Type ti = lookup(((IdentifierExp) n.array).name);
            if(ti == null){
                errors.undefinedId(((IdentifierExp) n.array).name);
            }
            check(n.index,new IntegerType());
            n.setType(new IntegerType());
            return n.getType();
        }

        return null;
    }

    @Override
    public Type visit(ArrayLength n) {
        check(n.array,new IntArrayType());
        return n.getType();
    }

    @Override
    public Type visit(BooleanLiteral n) {
        n.setType(new BooleanType());
        return n.getType();
    }

    @Override
    public Type visit(This n) {
        //need to somehow get the name of "this" class

        n.setType(new ObjectType(currClass));
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
        // check if this object type n.typeName exists in table as a class
        Type type = classes.lookup(n.typeName);
        if(type == null){
            errors.undefinedId(n.typeName);
        }
        else{
            n.setType(new ObjectType(n.typeName));
            return n.getType();
        }
        return new ObjectType(n.typeName);
    }

    @Override
    public Type visit(ClassType classType) {
        return classType;
    }

    @Override
    public Type visit(MethodType methodType) {
        return methodType;
    }
}
