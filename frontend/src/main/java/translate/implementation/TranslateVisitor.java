package translate.implementation;

import ast.*;
import ir.frame.Access;
import ir.frame.Frame;
import ir.temp.Label;
import ir.temp.Temp;
import ir.tree.BINOP.Op;
import ir.tree.*;
import ir.tree.CJUMP.RelOp;
import ir.tree.TEMP;
import translate.Fragments;
import translate.ProcFragment;
import translate.DataFragment;
import util.FunTable;
import util.List;
import util.Lookup;
import util.Pair;
import visitor.Visitor;

import static ir.tree.IR.*;
import static translate.TranslatorLabels.*;


/**
 * This visitor builds up a collection of IRTree code fragments for the body
 * of methods in a Functions program.
 * <p>
 * Methods that visit statements and expression return a TRExp, other methods
 * just return null, but they may add Fragments to the collection by means
 * of a side effect.
 *
 * @author kdvolder
 */
public class TranslateVisitor implements Visitor<TRExp> {
    /**
     * We build up a list of Fragment (pieces of stuff to be converted into
     * assembly) here.
     */
    private Fragments frags;

    /**
     * We use this factory to create Frame's, without making our code dependent
     * on the target architecture.
     */
    private Frame frameFactory;

    /**
     * The symbol table may be needed to find information about classes being
     * instantiated, or methods being called etc.
     */
    private Frame frame;

    private FunTable<IRExp> currentEnv;

    private String className;

    public TranslateVisitor(Pair<Lookup<Type>, Lookup<Type>> table, Frame frameFactory) {
        this.frags = new Fragments(frameFactory);
        this.frameFactory = frameFactory;
    }

    /////// Helpers //////////////////////////////////////////////


/*    private boolean atGlobalScope() {
        return frame.getLabel().equals(L_MAIN);
    }*/

    /**
     * Create a frame with a given number of formals. We assume that
     * no formals escape, which is the case in MiniJava.
     */
    private Frame newFrame(Label name, int nFormals) {
        return frameFactory.newFrame(name, nFormals);
    }

    /**
     * Creates a label for a function (used by calls to that method).
     * The label name is simply the function name.
     */
    private Label methodLabel(String functionName) {
        return Label.get(className + "_" + functionName);
    }

    private void putEnv(String name, Access access) {
        currentEnv = currentEnv.insert(name, access.exp(frame.FP()));
    }

    private void putEnv(String name, IRExp exp) {
        currentEnv = currentEnv.insert(name, exp);
    }


    ////// Visitor ///////////////////////////////////////////////

    @Override
    public <T extends AST> TRExp visit(NodeList<T> ns) {
        IRStm result = IR.NOP;
        for (int i = 0; i < ns.size(); i++) {
            AST nextStm = ns.elementAt(i);
            TRExp e = nextStm.accept(this);
            // e will be null if the statement was in fact a function declaration
            // just ignore these as they generate Fragments
            if (e != null)
                result = IR.SEQ(result, e.unNx());
        }
        return new Nx(result);
    }

    private TRExp visitStatements(NodeList<Statement> statements) {
        IRStm result = IR.NOP;
        for (int i = 0; i < statements.size(); i++) {
            Statement nextStm = statements.elementAt(i);
            result = IR.SEQ(result, nextStm.accept(this).unNx());
        }
        return new Nx(result);
    }

    /////////////////main related stuff/////////////////////////////////////////

    // This is Goal := MainClass (ClassDeclaration)* <EOF>

    @Override
    public TRExp visit(Program n) {

        currentEnv = FunTable.theEmpty();
        TRExp main = n.mainClass.accept(this);
        TRExp classes = n.classes.accept(this);

        return null;
    }

    @Override
    public TRExp visit(MainClass n) {
        // no formals because we cannot use args
        frame = newFrame(L_MAIN,0);
        TRExp st = n.statement.accept(this);
        IRStm body = IR.SEQ(st.unNx());
        body = frame.procEntryExit1(body);
        frags.add(new ProcFragment(frame, body));
        return null;
    }

    // data frag for fields, proc frags for methods
    // then copy super fields and super methods, create more frags
    @Override
    public TRExp visit(ClassDecl n) {
        //TODO we DONOT support superclass, nope nope nope
        //n.superName
        FunTable<IRExp> oldEnv = currentEnv;

        className = n.name;

//        if (n.vars.size() != 0) {
            //trying to use new Object as well
            NewObject nObj = new NewObject(n.name);
            IRExp ptr;
            ptr = nObj.accept(this).unEx();
            putEnv(className,ptr);
            /*Label g = Label.get(className);
            List ph = List.theEmpty();
            for (int i = 0; i < n.vars.size(); i++) {
                ph.cons(IR.CONST(0), ph);
            }
            IRData data = new IRData(g, ph);

            DataFragment decl = new DataFragment(frame, data);
            frags.add(decl);
            IRExp v = IR.MEM(IR.NAME(g));
            putEnv(className, v);

            for (int i = 0; i < n.vars.size(); i++) {
                putEnv(n.vars.elementAt(i).name,v);
                v = IR.BINOP(Op.PLUS,v,CONST(frame.wordSize()));
            }
        }*/

        n.methods.accept(this);
        if(n.superName!=null){
            currentEnv.merge(oldEnv);
        }
        //currentEnv = oldEnv;

        return null;
    }

    @Override
    public TRExp visit(Block n) {
        TRExp sts = visitStatements(n.statements);
        return sts;
    }

    /////////////////////print & assigns//////////////////////////////////////////////

    @Override
    public TRExp visit(Print n) {
        TRExp arg = n.exp.accept(this);
        return new Ex(IR.CALL(L_PRINT, arg.unEx()));
    }

    //TODO bound check
    @Override
    public TRExp visit(Assign n) {
        IRExp lhs;

        if(n.value instanceof NewArray){
            TRExp ptr = n.value.accept(this);
            putEnv(n.name.name, ptr.unEx());
            return new Nx(IR.NOP);
        } else{
            IRExp value = currentEnv.lookup(n.name.name);
            //if I already found it, just return
           // System.out.println("Assign n: name, value is: "+n.name.name+" "+value);
            if (value == null) {
                Access var = frame.allocLocal(false);
                putEnv(n.name.name, var);
                lhs = var.exp(frame.FP());
            }
            else{
                lhs = value;
            }
            TRExp val = n.value.accept(this);
            return new Nx(IR.MOVE(lhs, val.unEx()));
        }

    }

    //TODO bound check
    @Override
    public TRExp visit(ArrayAssign n) {
        IRExp base = currentEnv.lookup(n.name);
        IRExp offset = IR.BINOP(Op.MUL,n.index.accept(this).unEx(),CONST(frame.wordSize()));
        IRExp ptr = IR.BINOP(Op.PLUS,base,offset);

        IRStm rs = IR.MOVE(IR.MEM(ptr),n.value.accept(this).unEx());

        return new Nx(rs);
    }

    ///////////////////////types////////////////////////////////////////////

    @Override
    public TRExp visit(BooleanType n) {
        throw new Error("Not implemented");
    }

    @Override
    public TRExp visit(IntegerType n) {
        throw new Error("Not implemented");
    }

    @Override
    public TRExp visit(UnknownType n) {
        throw new Error("Not implemented");
    }

    @Override
    public TRExp visit(IntArrayType n) { throw new Error("Not implemented"); }

    @Override
    public TRExp visit(ObjectType n) {
        throw new Error("Not implemented");
    }

    @Override
    public TRExp visit(ClassType classType) {
        throw new Error("Not implemented");
    }

    @Override
    public TRExp visit(MethodType methodType) {
        throw new Error("Not implemented");
    }

    @Override
    public TRExp visit(FunctionType n) {
        throw new Error("Not implemented");
    }

    /////////////////////conditional//////////////////////////////////

    // this is ?: in function language
    @Override
    public TRExp visit(Conditional n) {
        /*Temp temp = new Temp();
        Label t = Label.gen();
        Label f = Label.gen();
        Label join = Label.gen();
        IRStm tst = n.e1.accept(this).unCx(t, f);
        IRStm thn = IR.SEQ(
                IR.LABEL(t),
                new Nx(IR.MOVE(temp, n.e2.accept(this).unEx())).unNx(),
                IR.JUMP(join));
        IRStm els = IR.SEQ(
                IR.LABEL(f),
                new Nx(IR.MOVE(temp, n.e3.accept(this).unEx())).unNx());

        return new Ex(IR.ESEQ(IR.SEQ(tst, thn, els, IR.LABEL(join)), IR.TEMP(temp)));*/
        return null;
    }


    @Override
    public TRExp visit(If n) {
        Temp temp = new Temp();
        Label t = Label.gen();
        Label f = Label.gen();
        Label endLabel = Label.gen();
        TRExp tst = n.tst.accept(this);
        TRExp thn = n.thn.accept(this);
        TRExp els = n.els.accept(this);
        IRStm body = IR.SEQ(
                tst.unCx(t,f),
                IR.LABEL(t),
                thn.unNx(),
                IR.JUMP(endLabel),
                IR.LABEL(f),
                els.unNx(),
                IR.LABEL(endLabel));
        return new Nx(body);
    }

    @Override
    public TRExp visit(While n) {
        Label start = Label.gen();
        Label end = Label.gen();

        IRStm tst = n.tst.accept(this).unCx(start, end);
//        System.out.println(n.body.accept(this).unNx());
        IRStm innerBody = n.body.accept(this).unNx();
        IRStm body = IR.SEQ(
                tst,
                IR.LABEL(start),
                innerBody,
                tst,
//                IR.JUMP(end),
                IR.LABEL(end));

        return new Nx(body);
    }

    ////////////////////////binops/////////////////////////////////////

    private TRExp relOp(final CJUMP.RelOp op, AST ltree, AST rtree) {
        final TRExp l = ltree.accept(this);
        final TRExp r = rtree.accept(this);
        return new TRExp() {
            @Override
            public IRStm unCx(Label t, Label f) {
                return IR.CJUMP(op, l.unEx(), r.unEx(), t, f);
            }

            @Override
            public IRStm unCx(IRExp dst, IRExp src) {
                return IR.CMOVE(op, l.unEx(), r.unEx(), dst, src);
            }

            @Override
            public IRExp unEx() {
                TEMP v = TEMP(new Temp());
                return ESEQ(SEQ(
                        MOVE(v, FALSE),
                        CMOVE(op, l.unEx(), r.unEx(), v, TRUE)),
                        v);
            }

            @Override
            public IRStm unNx() {
                Label end = Label.gen();
                return SEQ(unCx(end, end),
                        LABEL(end));
            }

        };

    }

    @Override
    public TRExp visit(LessThan n) {
        return relOp(RelOp.LT, n.e1, n.e2);
    }


    @Override
    public TRExp visit(And n) {
        final TRExp l = n.e1.accept(this);
        final TRExp r = n.e2.accept(this);
        return new Cx() {
            @Override
            public IRStm unCx(Label t, Label f) {
                Label do_r = Label.gen();
                return SEQ(
                        l.unCx(do_r,f),
                        LABEL(do_r),
                        r.unCx(t, f));
            }
            @Override
            public IRStm unCx(IRExp dst, IRExp src) {
                IRStm tr = IR.MOVE(dst,CONST(1));
                IRStm p1 = IR.CMOVE(RelOp.EQ, l.unEx(), CONST(0),dst,CONST(0));
                IRStm rs = IR.CMOVE(RelOp.EQ, r.unEx(), CONST(0),dst,CONST(0));

                return IR.SEQ(tr,p1,rs);
            }
        };
    }


    /*@Override
    public TRExp visit(And n) {
        TRExp e1 = n.e1.accept(this);
        TRExp e2 = n.e2.accept(this);
        Temp t = new Temp();
        Label end = Label.gen();
        Label cont = Label.gen();
        Label cont2 = Label.gen();
        IRStm p1 = IR.MOVE(t,CONST(0));
        IRStm p2 = IR.CJUMP(RelOp.EQ,e1.unEx(),CONST(0),end,cont);
        IRStm p3 = IR.CJUMP(RelOp.NE,e2.unEx(),CONST(0),cont2,end);
        IRStm p4 = IR.MOVE(t,CONST(1));
        return new Ex(IR.ESEQ(IR.SEQ(p1,p2,IR.LABEL(cont),p3,IR.LABEL(cont2),p4,IR.LABEL(end)),IR.TEMP(t)));
    }*/

    //////////////////////more binops////////////////////////////////////////

    private TRExp numericOp(Op op, Expression e1, Expression e2) {
        TRExp l = e1.accept(this);
        TRExp r = e2.accept(this);
        return new Ex(IR.BINOP(op, l.unEx(), r.unEx()));
    }

    @Override
    public TRExp visit(Plus n) {
        return numericOp(Op.PLUS, n.e1, n.e2);
    }

    @Override
    public TRExp visit(Minus n) {
        return numericOp(Op.MINUS, n.e1, n.e2);
    }

    @Override
    public TRExp visit(Times n) {
        return numericOp(Op.MUL, n.e1, n.e2);
    }

    //////////////////////method stuff////////////////////////////////////////////

    @Override
    public TRExp visit(FunctionDecl n) {
        /*Frame oldframe = frame;
        frame = newFrame(functionLabel(n.name), n.formals.size());
        FunTable<IRExp> saveEnv = currentEnv;

        //Get the access information for each regular formal and add it to the environment.
        for (int i = 0; i < n.formals.size(); i++) {
            putEnv(n.formals.elementAt(i).name, frame.getFormal(i));
        }

        TRExp stats = visitStatements(n.statements);
        TRExp exp = n.returnExp.accept(this);

        IRStm body = IR.SEQ(
                stats.unNx(),
                IR.MOVE(frame.RV(), exp.unEx()));
        body = frame.procEntryExit1(body);
        frags.add(new ProcFragment(frame, body));

        frame = oldframe;
        currentEnv = saveEnv;*/

        return null;
    }


    // TODO duplicate entry
    @Override
    public TRExp visit(MethodDecl n) {
        Frame oldframe = frame;
        frame = newFrame(methodLabel(n.name), n.formals.size()+1);
        FunTable<IRExp> saveEnv = currentEnv;

        //TODO use ptr
//        System.out.println("Get the 0th formal: "+frame.getFormal(0));
//        Access ptr = frame.getFormal(0);
//        Label g = Label.get(className);
//        IRExp v = IR.MEM(IR.NAME(g));

        //Get the access information for each regular formal and add it to the environment.
        for (int i = 1; i < n.formals.size()+1; i++) {
            putEnv(n.formals.elementAt(i-1).name, frame.getFormal(i));
        }
        n.vars.accept(this);

        TRExp stats = n.statements.accept(this);

        TRExp exp = n.returnExp.accept(this);

        IRStm body = IR.SEQ(
                stats.unNx(),
                IR.MOVE(frame.RV(), exp.unEx()));
        body = frame.procEntryExit1(body);
        frags.add(new ProcFragment(frame, body));

        frame = oldframe;
        currentEnv = saveEnv;

        return null;
    }


    @Override
    public TRExp visit(VarDecl n) {
        switch(n.kind) {
            case LOCAL:
                Access var = frame.allocLocal(false);
                putEnv(n.name, var);
                break;
            case FORMAL:

                break;
            case FIELD:
                //in classDecl
                break;
        }
        return null;
    }

    @Override
    public TRExp visit(Call n) {
        String functionName = "unknown";
        if (n.name instanceof IdentifierExp) {
            functionName = ((IdentifierExp) n.name).name;
        }
        List<IRExp> args = List.list();

        // 3 cases for receiver: 1. new object 2. identifierExp 3.This
        IRExp ptr = null;
        String old_className = className;
        if (n.receiver instanceof NewObject){
            ptr = n.receiver.accept(this).unEx();
            className = ((NewObject)n.receiver).typeName;
            //System.out.println("ptr is: "+ptr);
        }
        else if (n.receiver instanceof IdentifierExp){
            IdentifierExp tmp = (IdentifierExp)n.receiver;
            ptr = currentEnv.lookup(tmp.name);
            if(tmp.getType() instanceof ObjectType){
                className = ((ObjectType) tmp.getType()).name;
            } else throw new Error("you should be an object =(");
        }
        else if (n.receiver instanceof This){
            //System.out.println("classname is: "+className);
            n.receiver.accept(this);
            ptr = currentEnv.lookup(className);
            //System.out.println("ptr is: "+ptr);
//            if (ptr == null){
//                ptr = IR.MEM(CONST(0));
//            }
        }
        else{
            throw new Error("receiver must be newObject or IdentifierExp or This");
        }
//        return new Ex(IR.CONST(0));
//        if (ptr == null){
            // there is no global fields, but we need to pass in something
//            Label special_null = Label.get("null");
//            Temp t = new Temp();
//            ptr = new Ex(ESEQ(IR.MOVE(TEMP(t),IR.CONST(0)),TEMP(t))).unEx();
//        }
        args.add(ptr);
        for (int i = 0; i < n.rands.size(); i++) {
            TRExp arg = n.rands.elementAt(i).accept(this);
            args.add(arg.unEx());
        }
//        System.out.println("call n: args are: "+args);
//        System.out.println("call n: methodLabel is: "+methodLabel(functionName));
        TRExp ret = new Ex(IR.CALL(methodLabel(functionName), args));
//        System.out.println("call n: ret: "+ret.unEx());
        className = old_className;
        return ret;
    }

    //////////////////////primary exps/////////////////////////////////

    @Override
    public TRExp visit(IntegerLiteral n) {
        return new Ex(IR.CONST(n.value));
    }

    @Override
    public TRExp visit(This n) {
        // TODO
        if(!n.typed()){
            //System.out.println("This n: Need to set type!!!");
            n.setType(new ObjectType(className));
        }
        if(n.getType() instanceof ObjectType){
            className = ((ObjectType) n.getType()).name;
           // System.out.println("This n: set type name to: "+className);
        }
        else throw new Error("hey you should be an object");
        return null;
        /*Access ths = frame.getFormal(0);
        return new Ex(ths.exp(frame.FP()));*/
    }

    @Override
    public TRExp visit(BooleanLiteral n) {
        Temp t = new Temp();
        IRStm s;
        if (n.value) s = IR.MOVE(t,CONST(1));
        else s=IR.MOVE(t, CONST(0));
        return new Ex(IR.ESEQ(s,IR.TEMP(t)));
    }

    @Override
    public TRExp visit(IdentifierExp n) {
        IRExp var = currentEnv.lookup(n.name);
        return new Ex(var);
    }

    @Override
    public TRExp visit(Not n) {
        final TRExp negated = n.e.accept(this);
        return new Cx() {
            @Override
            public IRStm unCx(Label ifTrue, Label ifFalse) {
                return negated.unCx(ifFalse, ifTrue);
            }

            @Override
            public IRStm unCx(IRExp dst, IRExp src) {
                return new Ex(IR.BINOP(Op.PLUS, IR.CONST(-1), negated.unEx())).unCx(dst, src);
            }

            @Override
            public IRExp unEx() {
                return new Ex(IR.BINOP(Op.PLUS, IR.CONST(-1), negated.unEx())).unEx();
            }
        };
    }

    ////////////////////array & alloc/////////////////////////////////////////

    @Override
    public TRExp visit(ArrayLookup n) {

        IRExp ptr = n.array.accept(this).unEx();
        IRExp index = n.index.accept(this).unEx();
        IRExp p = IR.BINOP(Op.PLUS, ptr, IR.BINOP(Op.MUL, index, IR.CONST(frame.wordSize())));
        TRExp r = new Ex(IR.MEM(p));
        return r;
    }

    @Override
    public TRExp visit(ArrayLength n) {
        Temp t = new Temp();
        Temp t2 = new Temp();
        TRExp arr = n.array.accept(this);
        //assuming identifier TODO
        IRExp p = currentEnv.lookup(((IdentifierExp)n.array).name);
        IRStm p1 = IR.MOVE(TEMP(t),p);
        IRStm p2 = new Ex(IR.BINOP(Op.MINUS,TEMP(t),CONST(frame.wordSize()))).unNx();
        IRStm size = IR.MOVE(TEMP(t2),IR.MEM(TEMP(t)));
        return new Ex(IR.ESEQ(SEQ(p1,p2,size),TEMP(t2)));
    }

    @Override
    public TRExp visit(NewArray n) {
        // use L_NEW_ARRAY
        Frame oldf = frame;

        if(n.size instanceof IntegerLiteral){
            frame = newFrame(L_NEW_ARRAY,Integer.parseInt(n.size.toString()));
        }
        else{
            TRExp size = n.size.accept(this);
            return new Ex(IR.CALL(L_NEW_ARRAY, size.unEx()));

        }
        //TRExp ptr = new Ex(IR.CALL(L_NEW_ARRAY,size));
        frame = oldf;
        return new Ex(frame.FP());

    }

    @Override
    public TRExp visit(NewObject n) {
        // use L_NEW_OBJECT
        //String cn = n.typeName;
        //TODO need to find all global variables in this class cn
        Frame oldf = frame;
        int size = (currentEnv.size() - frame.getFormals().size())*frame.wordSize();
        frame = newFrame(L_NEW_OBJECT,size);
        //TRExp ptr = new Ex(IR.CALL(L_NEW_OBJECT,CONST(size)));
        frame = oldf;
        return new Ex(frame.FP());
    }


    /**
     * After the visitor successfully traversed the program,
     * retrieve the built-up list of Fragments with this method.
     */
    public Fragments getResult() {
        return frags;
    }


}
