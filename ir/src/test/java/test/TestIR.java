package test;

import java.io.File;
import java.io.IOException;

import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;
import ir.interp.Interp;
import ir.interp.InterpMode;
import ir.parser.ParseException;
import ir.parser.Parser;
import ir.temp.Label;
import ir.temp.Temp;
import ir.tree.IRData;
import ir.tree.IR;
import ir.tree.IRExp;
import ir.tree.IRStm;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import translate.DataFragment;
import translate.Fragment;
import translate.Fragments;
import translate.ProcFragment;
import translate.TranslatorLabels;
import util.List;
import util.SampleCode;

public class TestIR {
    public static final Frame architecture = X86_64Frame.factory;

    public static Fragments makeFragments(IRData data, IRStm code) {
        Fragment f = new ProcFragment(architecture.newFrame(TranslatorLabels.L_MAIN, 0), code);
        Fragments ans = new Fragments(architecture);
        ans.add(f);
        if (data != null) {
            Fragment g = new DataFragment(architecture, data);
            ans.add(g);
        }
        return ans;
    }

    @Test
    public void TestNOP() throws Exception {
        test("", makeFragments(null, IR.NOP));
    }

    @Test
    public void TestDATA() throws Exception {
        List<IRExp> data = List.empty();
        data = List.cons(IR.CONST(3), data);
        data = List.cons(IR.NAME(Label.get("A_foo")), data);
        test("", makeFragments(IR.DATA(Label.get("A_vft"), data), IR.NOP));
    }

    @Test
    public void TestGlobalInt() throws Exception {
        List<IRExp> data = List.empty();
        data = List.cons(IR.CONST(11), data);
        IRData decl = IR.DATA(Label.get("a"), data);
        Temp t = new Temp(), t2 = new Temp();
        IRStm move = IR.MOVE(IR.TEMP(t), IR.NAME(Label.get("a")));
        IRStm move2 = IR.MOVE(IR.TEMP(t2), IR.MEM(IR.PLUS(IR.TEMP(t), IR.CONST(0))));
        IRExp call = IR.CALL(TranslatorLabels.L_PRINT, IR.TEMP(t2));
        IRStm body = IR.SEQ(move, move2, IR.EXP(call));
        test("11\n", makeFragments(decl, body));
    }

    @Test
    public void TestLoadData() throws Exception {
        List<IRExp> data = List.empty();
        data = List.cons(IR.CONST(3), data);
        data = List.cons(IR.NAME(Label.get("A_foo")), data);
        IRData decl = IR.DATA(Label.get("A_vft"), data);
        Temp t = new Temp(), t2 = new Temp();
        IRStm move = IR.MOVE(IR.TEMP(t), IR.NAME(Label.get("A_vft")));
        IRStm move2 = IR.MOVE(IR.TEMP(t2), IR.MEM(IR.PLUS(IR.TEMP(t), IR.CONST(8))));
        IRExp call = IR.CALL(TranslatorLabels.L_PRINT, IR.TEMP(t2));
        IRStm body = IR.SEQ(move, move2, IR.EXP(call));
        test("3\n", makeFragments(decl, body));
    }

    @Test
    public void testReadIR() throws IOException, ParseException {
        File[] samples = SampleCode.sampleFiles("ir");
        for (File s : samples) {
            Fragments f = Parser.parse(s);
            System.out.println(f);
            Interp interp = new Interp(f, getSimulationMode());
            String result;
            try {
                result = interp.run();
            } catch (Error e) {
                result = e.getMessage();
            }
            System.out.println("File " + s.getName() + " gives " + result);
        }
    }

    private boolean dumpIR() {
        return true;
    }

    private InterpMode getSimulationMode() {
        return InterpMode.TRACE_SCHEDULE;
    }

    protected Fragments test(String expected, Fragments program) throws Exception {
        if (dumpIR()) {
            System.out.println("VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
            System.out.println(program);
            System.out.println();
        }
        if (getSimulationMode() != null) {
            System.out.println("Simulating IR code:");
            Interp interp = new Interp(program, getSimulationMode());
            String result = interp.run();
            System.out.print(result);
            Assertions.assertEquals(expected, result);
        }
        System.out.println("=================================");
        return program;
    }

}
