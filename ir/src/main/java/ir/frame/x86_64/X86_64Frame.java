package ir.frame.x86_64;

import static ir.tree.IR.MOVE;
import static ir.tree.IR.SEQ;
import static ir.tree.IR.TEMP;
import static util.List.list;

import util.IndentingWriter;
import util.List;
import ir.frame.Access;
import ir.frame.Frame;
import ir.frame.x86_64.InArg;
import ir.interp.Interp;
import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.temp.Label;
import ir.temp.Temp;
import ir.tree.IR;
import ir.tree.IRExp;
import ir.tree.IRStm;

/* Stack frame layout: 
 First 6 out arguments go in registers
 ESP+0  -->       outArg[7]
 ESP+8  -->       outArg[8]
 ...              ...

 EBP-8*(n+1) -->  local[n]
 ...              ...
 EBP-16 -->       local[1] 
 EBP-8  -->       local[0] 
 EBP    -->       saved EBP 
 EBP+8  -->       return address
 EBP+16  -->      inArg[7]
 EBP+24  -->      inArg[8]
 EBP+32 -->       inArg[9]
 ... 

 */


public class X86_64Frame extends Frame {

    public static final Temp RAX = new Temp("%rax");
    static final Temp RBX = new Temp("%rbx");
    static final Temp RCX = new Temp("%rcx");
    public static final Temp RDX = new Temp("%rdx");
    public static final Temp RSI = new Temp("%rsi");
    public static final Temp RDI = new Temp("%rdi");

    static final Temp RBP = new Temp("%rbp");
    static final Temp RSP = new Temp("%rsp");

    static final Temp R8 = new Temp("%r8");
    static final Temp R9 = new Temp("%r9");
    static final Temp R10 = new Temp("%r10");
    static final Temp R11 = new Temp("%r11");
    static final Temp R12 = new Temp("%r12");
    static final Temp R13 = new Temp("%r13");
    static final Temp R14 = new Temp("%r14");
    static final Temp R15 = new Temp("%r15");

    public static final List<Temp> callerSave = list(RAX, R10, R11);
    public static final List<Temp> calleeSave = list(RBX, R12, R13, R14, R15);
    public static final List<Temp> special = list(RSP, RBP);

    public static final List<Temp> arguments = list(RDI, RSI, RDX, RCX, R8, R9);
    public static final Temp RV = RAX; // return value
    public static final Temp SP = RSP; // stack pointer
    public static final Temp FP = RBP; // frame pointer

    public static final Frame factory = new X86_64Frame();

    public static final int WORD_SIZE = 8;
    public static final int FIRST_FORMAL_OFFSET = 16;
    public static final int FORMAL_INCREMENT = WORD_SIZE;
    private static final int FIRST_LOCAL_OFFSET = -8;
    private static final int LOCAL_INCREMENT = -WORD_SIZE;

    private int nextLocalOffset = FIRST_LOCAL_OFFSET;
    private int maxOutArgs;

    @Override
    public Frame newFrame(Label name, int nFormals) {
        return new X86_64Frame(name, nFormals);
    }

    protected X86_64Frame(Label label, int nFormals) {
        super(label, allocFormals(nFormals));
        this.done = Label.generate("bail");
    }

    static List<Access> toListOfAccess(List<Temp> formals) {
        List<Access> res = List.empty();
        for (Temp f : formals) {
            Access a = new InReg(f);
            res = List.cons(a, res);
        }
        return res.reverse();
    }

    public X86_64Frame(Label label, int offset, List<Temp> formals) {
        super(label, toListOfAccess(formals));
        nextLocalOffset = offset;
        this.done = Label.generate("bail");
    }

    private X86_64Frame() {
        //This is not a "real" frame, it is the prototype from which
        //real frames get created by calling its newFrame method.
        super(Label.generate("dummy"), allocFormals(0));
    }

    private static List<Access> allocFormals(int nFormals) {
        List<Access> formals = List.list();
        for (int i = 0; i < nFormals; ++i) {
            formals.add(new InReg(new Temp()));
        }
        return formals;
    }

    @Override
    public Access allocLocal(boolean escapes) {
        if (escapes) {
            InFrame access = new InFrame(nextLocalOffset);
            nextLocalOffset += LOCAL_INCREMENT;
            return access;
        } else {
            return new InReg(new Temp());
        }
    }

    @Override
    public IRExp FP() {
        return TEMP(FP);
    }

    @Override
    public IRExp RV() {
        return TEMP(RV);
    }

    @Override
    public int wordSize() {
        return WORD_SIZE;
    }

    public void dump(IndentingWriter out) {
        out.print("X86_64Frame { label = ");
        out.println(this.getLabel());
        out.indent();

        out.println("nextLocalOffset = " + nextLocalOffset);
        out.print("formals = ");
        out.println(this.getFormals());

        out.outdent();
        out.print("}");
    }

    @Override
    public IRStm procEntryExit1(IRStm body) {
        IRStm preAmble = IR.NOP;
        IRStm postAmble = IR.NOP;
        postAmble = IR.LABEL(done);
        if (true) {
            for (Temp reg : calleeSave) {
                IRExp saveSpot = allocLocal(false).exp(FP());
                preAmble = IR.SEQ(preAmble,
                        MOVE(saveSpot, TEMP(reg)));
                postAmble = SEQ(postAmble,
                        MOVE(TEMP(reg), saveSpot));
            }
        }
        if (true) {
            List<Access> f = getFormals();
            for (int i = 0; i < f.size(); ++i) {
                Access formal = f.get(i);
                InArg reg = new InArg(i);
                IRExp regexp = reg.exp(FP());
                IRExp formalexp = formal.exp(FP());
                preAmble = IR.SEQ(preAmble, MOVE(formalexp, regexp));
            }
        }
        return SEQ(preAmble, body, postAmble);
    }

    @Override
    public X86_64SimFrame newSimFrame(Interp interp, List<Word> args) {
        return new X86_64SimFrame(interp, this, args);
    }

    //////////////////////////////////
    // Chapter 9 CodeGenerator phase

    @Override
    public Access getOutArg(int i) {
        maxOutArgs = Math.max(i + 1, maxOutArgs);
        return new OutArg(this, i);
    }

    @Override
    public Access getInArg(int i) {
        return new InArg(i);
    }

    public static Access inArg(int i) {
        return new InArg(i);
    }

    @Override
    public List<Temp> registers() {
        return callerSave.append(calleeSave).append(arguments).append(special);
    }

    public static List<Temp> allregisters() {
        return callerSave.append(calleeSave).append(arguments).append(special);
    }

    /**
     * Number of locals, this does not include the special
     * locals allocated at the top of the stack for passing
     * outgoing arguments.
     */
    public int numLocals() {
        return (nextLocalOffset - FIRST_LOCAL_OFFSET) / LOCAL_INCREMENT;
    }

    /**
     * Number of bytes needed for local data. This includes both
     * locals allocated by calling allocLocal and slots for outgoing
     * argument at the top of the stack frame.
     */
    private int localsSpace() {
        return (numLocals() + (maxOutArgs > arguments.size() ? maxOutArgs - arguments.size() : 0)) * wordSize();
    }

    private boolean inArgsOnStack() {
        List<Access> f = getFormals();
        return f.size() > arguments.size();
    }

    /**
     * Emit code that goes at the top of the procedure body
     * to set up the stack frame. This is done every time
     * an Assembly proc gets printed, so that it is always
     * up-to-date with the amount of space needed for local
     * data (which is only known at the very end of compilation.
     */
    @Override
    public void entrySequence(IndentingWriter out) {
        int localsSpace = localsSpace();
        if (localsSpace % 16 != 0)
            localsSpace += 8;
        if (localsSpace > 0 || inArgsOnStack()) {
            out.println("pushq  %rbp");
            out.println("movq   %rsp, %rbp");
            if (localsSpace > 0)
                out.println("subq   $" + localsSpace + ", %rsp");
        } else if (maxOutArgs > 0) {
            out.println("subq   $8, %rsp");
        }
    }

    @Override
    public void exitSequence(IndentingWriter out) {
        if (localsSpace() > 0 || inArgsOnStack())
            out.println("leave");
        else if (maxOutArgs > 0)
            out.println("addq   $8, %rsp");
        out.println("ret");
    }
}
