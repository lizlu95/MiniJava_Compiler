package typechecker.implementation;

import ast.*;
import typechecker.ErrorReport;
import util.ImpTable;
import util.ImpTable.DuplicateException;
import util.Pair;
import visitor.DefaultVisitor;

/**
 * This visitor implements Phase 1 of the TypeChecker. It constructs the symboltable.
 *
 * @author norm
 */
public class BuildSymbolTableVisitor extends DefaultVisitor<Pair<ImpTable<Type>, ImpTable<Type>>> {

    private final ImpTable<Type> globals = new ImpTable<Type>();
    private final ImpTable<Type> functions = new ImpTable<Type>();
    private final ImpTable<Type> mainTable = new ImpTable<Type>();
    private final ImpTable<Type> classes = new ImpTable<Type>();
    private final ErrorReport errors;
    private ImpTable<Type> thisFunction = null;
    private ImpTable<Type> thisFields = null;
    private ImpTable<Type> thisMethods = null;
    private ImpTable<Type> thisSuperFields = null;
    private ImpTable<Type> thisSuperMethods = null;
    private ImpTable<Type> thisParams = null;
    private ImpTable<Type> thisLocals = null;
    private ImpTable<Type> thisVarDecls = null;// can either be param or local table






    public BuildSymbolTableVisitor(ErrorReport errors) {
        this.errors = errors;
    }

    /////////////////// Phase 1 ///////////////////////////////////////////////////////
    // In our implementation, Phase 1 builds up a symbol table containing all the
    // global identifiers defined in a Functions program, as well as symbol tables
    // for each of the function declarations encountered.
    //
    // We also check for duplicate identifier definitions in each symbol table

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Program n) {
        n.mainClass.accept(this);//todo
        n.classes.accept(this);//todo
        return new Pair(mainTable,classes);
//        n.statements.accept(this);
//        n.print.accept(this); // process all the "normal" classes.
//        return new Pair(globals,functions);
    }

    @Override
    public <T extends AST> Pair<ImpTable<Type>, ImpTable<Type>> visit(NodeList<T> ns) {
        for (int i = 0; i < ns.size(); i++)
            ns.elementAt(i).accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Assign n) {
        // if current method has no parameter nor locals, add n.name to class global variable
        //todo which table to insert this in?
        ImpTable<Type> t = thisVarDecls != null? thisVarDecls : thisFields;
        def(t,n.name.name,new UnknownType());
//        ImpTable<Type> t = thisFunction != null ? thisFunction : globals;
//        def(t, n.name.name, new UnknownType());
//        n.value.accept(this);
        return null;
    }


    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(IdentifierExp n) {
        lookup(n.name);// modified lookup to suit new implementation
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Conditional n) {
        n.e1.accept(this);
        n.e2.accept(this);
        n.e3.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(BooleanType n) {
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(IntegerType n) {
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Print n) {
        n.exp.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(LessThan n) {
        n.e1.accept(this);
        n.e2.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Plus n) {
        n.e1.accept(this);
        n.e2.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Minus n) {
        n.e1.accept(this);
        n.e2.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>>visit(Times n) {
        n.e1.accept(this);
        n.e2.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(IntegerLiteral n) {
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Not not) {
        not.e.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(UnknownType n) {
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(FunctionDecl n) {
        FunctionType ft = new FunctionType();
        thisFunction = new ImpTable<Type>();
        ft.locals = thisFunction;
        ft.formals = n.formals;
        ft.returnType = n.returnType;
        n.formals.accept(this);
        n.statements.accept(this);
        n.returnExp.accept(this);
        n.type = ft;
        def(functions, n.name, ft);
        thisFunction = null;
        return null;
    }

    

    @Override
    // This is a formal parameter to the current function
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(VarDecl n) {
        //add current variable to appropriate var table
        ast.VarDecl.Kind kind = n.kind;
        if(kind == VarDecl.Kind.FIELD){
            if(thisFields != null) {
                def(thisFields, n.name, n.type);
            }
            else{throw  new Error("no class field table allocated");}
        }
        else if(kind == VarDecl.Kind.FORMAL){
            if(thisParams != null) {
                def(thisParams, n.name, n.type);
            }
            else{throw  new Error("no class formal table allocated");}
        }
        else if(kind == VarDecl.Kind.LOCAL){
            if(thisLocals != null) {
                def(thisLocals, n.name, n.type);
            }
            else{throw  new Error("no class field table allocated");}
        }
        else{
            throw new Error("variable kind invalid");
        }

        return null;
    }
    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(ClassType n){
        return null;

    }
    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(MethodType n){
        return null;

    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(FunctionType n) {
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Call n) {
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(ClassDecl n){
        ClassType ct = new ClassType();
        thisFields = new ImpTable<Type>();
        thisMethods = new ImpTable<Type>();
        ct.fields = thisFields;
        ct.methds = thisMethods;
        if(n.superName != null){
            ClassType sct = (ClassType) classes.lookup(n.superName);
            if(sct != null){
                thisSuperFields = sct.fields;
                thisSuperMethods = sct.methds;
            }
            else{
                throw new Error("super class not found");
            }
        }
        //todo maybe need fields inside classtype
        n.vars.accept(this);
        n.methods.accept(this);
        n.type = ct;
        def(classes,n.name,ct);
        thisFields = null;
        thisMethods = null;
        thisSuperFields = null;
        thisSuperMethods = null;
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(MethodDecl n){

        MethodType mt = new MethodType();
        thisParams = new ImpTable<Type>();
        thisLocals = new ImpTable<Type>();
        mt.params = thisParams;
        mt.locals = thisLocals;
        thisVarDecls = thisParams;
        thisVarDecls = thisLocals;
        n.formals.accept(this);
        n.vars.accept(this);
        n.statements.accept(this);//todo
        n.returnExp.accept(this);
        n.type = mt;
        def(thisMethods,n.name,mt);
        thisParams = null;
        thisLocals = null;
        thisVarDecls = null;
        return null;
    }
    ///////////////////// Helpers ///////////////////////////////////////////////
    // Lookup a name in the two symbol tables that it might be in
    private Type lookup(String name) {
        Type t = null;
        if(thisParams != null){
            t = thisParams.lookup(name);
            if(t!= null){
                return t;
            }
        }
        if(thisLocals != null){
            t = thisLocals.lookup(name);
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

//        if (thisFunction != null) {
//            t = thisFunction.lookup(name);
//            if (t != null)
//                return t;
//        }
//        t = globals.lookup(name);
        if (t == null)
            errors.undefinedId(name);
        return t;
    }


    /**
     * Add an entry to a table, and check whether the name already existed.
     * If the name already existed before, the new definition is ignored and
     * an error is sent to the error report.
     */
    private <V> void def(ImpTable<V> tab, String name, V value) {
        try {
            tab.put(name, value);
        } catch (DuplicateException e) {
            errors.duplicateDefinition(name);
        }
    }



}