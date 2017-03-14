package typechecker.implementation;

import ast.*;
import typechecker.ErrorReport;
import util.ImpTable;
import util.ImpTable.DuplicateException;
import util.IndentingWriter;
import util.Pair;
import visitor.DefaultVisitor;

import java.io.StringWriter;

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
    }

    @Override
    public <T extends AST> Pair<ImpTable<Type>, ImpTable<Type>> visit(NodeList<T> ns) {
        for (int i = 0; i < ns.size(); i++)
            ns.elementAt(i).accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(MainClass n){
        ClassType ct = new ClassType();
        thisFields = new ImpTable<Type>();
        thisMethods = new ImpTable<Type>();
        ct.fields = thisFields;
        ct.methds = thisMethods;
        n.type = ct;
        def(mainTable,n.className,ct);
        def(classes,n.className,ct);
        thisFields = null;
        thisMethods = null;

        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Assign n) {
        lookup(n.name.name);
        return null;
    }


    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(IdentifierExp n) {
        lookup(n.name);// modified lookup to suit new implementation
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
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(IntArrayType n){
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(ObjectType n){
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(If n){
        n.tst.accept(this);
        n.thn.accept(this);
        n.els.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(While n){
        n.tst.accept(this);
        n.body.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(ArrayAssign n){
        lookup(n.name);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(And n){
        n.e1.accept(this);
        n.e2.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(ArrayLookup n){
        n.array.accept(this);
        n.index.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(ArrayLength n){
        n.array.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(This n){
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(NewArray n){
        n.size.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(NewObject n){
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(Block n){
        n.statements.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(BooleanLiteral n){
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
            else{errors.undefinedId(n.name);}
        }
        else if(kind == VarDecl.Kind.FORMAL){
            if(thisParams != null) {
                def(thisParams, n.name, n.type);
            }
            else{errors.undefinedId(n.name);}
        }
        else if(kind == VarDecl.Kind.LOCAL){
            if(thisLocals != null) {
                def(thisLocals, n.name, n.type);
            }
            else{errors.undefinedId(n.name);}
        }
        else{
            errors.undefinedId(n.name);
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
        n.receiver.accept(this);
        n.name.accept(this);
        n.rands.accept(this);
        return null;
    }

    @Override
    public Pair<ImpTable<Type>, ImpTable<Type>> visit(ClassDecl n){
        ClassType ct = new ClassType();
        thisFields = new ImpTable<Type>();
        thisMethods = new ImpTable<Type>();

        ct.superName = n.superName;
        if(n.superName != null){
            ClassType sct = (ClassType) classes.lookup(n.superName);
            if(sct != null){
                thisSuperFields = sct.fields;
                thisSuperMethods = sct.methds;
            }
            else{
                errors.undefinedId(n.superName);
            }
        }
        //todo maybe need fields inside classtype
        n.vars.accept(this);
        n.methods.accept(this);
        ct.fields = thisFields;
        ct.methds = thisMethods;
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
        mt.returnType = n.returnType;
        mt.formals = n.formals;
        thisVarDecls = thisParams;
        thisVarDecls = thisLocals;
        n.formals.accept(this);
        n.vars.accept(this);
        n.statements.accept(this);//todo
        n.returnExp.accept(this);
        n.type = mt;
        def(thisMethods,n.name,mt);
        dumpTable(thisMethods);
        thisParams = null;
        thisLocals = null;
        thisVarDecls = null;
        return null;
    }
    ///////////////////// Helpers ///////////////////////////////////////////////
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

    private void dumpTable(ImpTable<Type> table){
        System.out.println("====================");
        StringWriter out = new StringWriter();
        table.dump(new IndentingWriter(out));
        System.out.println(out.toString());
        System.out.println("====================");
    }

}