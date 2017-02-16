package analysis.implementation;

import static util.List.list;

import java.util.Map;

import util.List;
import codegen.AssemProc;
import codegen.assem.A_OPER;
import codegen.assem.Instr;
import ir.temp.Color;
import ir.temp.Temp;
import ir.frame.x86_64.InFrame;
import ir.frame.x86_64.X86_64Frame;

public class Rewriter {
    AssemProc proc;
    List<Instr> collect = List.empty();
    boolean beVerbose = false;

    public Rewriter(AssemProc proc) {
        this.proc = proc;
    }

    // Add t to the list of instructions
    private void collect(Instr t) {
        if (beVerbose) System.out.println(t);
        collect = List.cons(t, collect);
    }

    private void done() {
        collect = collect.reverse();
    }

    public List<Instr> rewrite(List<Temp> spilled, Map<Temp, Color> map) {
        if (beVerbose) System.out.println("Rewriting: " + proc + "\nFixing: ");
        for (Temp t : spilled) {
            if (beVerbose) System.out.println(t + " -> " + map.get(t));
        }
        for (Instr instr : proc.getBody()) {
            List<Temp> def = instr.def();
            List<Temp> use = instr.use();
            if (beVerbose) System.out.println("Rewriting: " + instr);
            List<Temp> oldtemp = List.empty();
            List<Temp> newtemp = List.empty();
            List<Instr> flush = List.empty();
            for (Temp t : spilled) {
                boolean di = def.contains(t);
                boolean ui = use.contains(t);
                int ofs = 0;
                Temp base = null;
                Temp newt = null;
                if (ui || di) {
                    Color c = map.get(t);
                    SpillColor sc = (SpillColor) c;
                    ofs = ((InFrame) sc.access).offset;
                    base = X86_64Frame.FP;
                }
                if (ui) {
                    // We need to load this temp into a reg before the instruction
                    newt = new Temp();
                    oldtemp = List.cons(t, oldtemp);
                    newtemp = List.cons(newt, newtemp);
                    Instr load = new A_OPER("movq    " + ofs + "(`s0), `d0", list(newt), list(base));
                    collect(load);
                }
                if (di) {
                    // We need to write this temp into the spill location after the instruction
                    // If we already allocated a temp, then use that, otherwise use the original
                    if (newt == null) {
                        newt = new Temp();
                        oldtemp = List.cons(t, oldtemp);
                        newtemp = List.cons(newt, newtemp);
                    }
                    Instr store = new A_OPER("movq    `s0, " + ofs + "(`s1)", Instr.notemps, list(newt, base));
                    flush = List.cons(store, flush);
                }
            }
            if (oldtemp.isEmpty()) {
                // No changes necessary
                collect(instr);
            } else {
                Instr newi = instr.clone(oldtemp, newtemp);
                collect(newi);
                for (Instr after : flush) {
                    collect(after);
                }
            }
        }
        done();
        if (beVerbose) System.out.println("Rewriten to: " + collect);
        return collect;
    }
}
