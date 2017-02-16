package translate.implementation;

import ast.Program;
import ast.Type;
import ir.frame.Frame;
import translate.Fragments;
import typechecker.TypeChecked;
import typechecker.implementation.TypeCheckerImplementation;
import util.ImpTable;
import util.Pair;

public class TranslateImplementation {

    private Frame frameFactory;
    private Program program;
    private Pair<ImpTable<Type>, ImpTable<Type>> table;

    public TranslateImplementation(Frame frameFactory, TypeChecked _typechecked) {
        this.frameFactory = frameFactory;
        TypeCheckerImplementation typechecked = (TypeCheckerImplementation) _typechecked;
        this.program = typechecked.getProgram();
        this.table = typechecked.getTable();
    }

    public Fragments translate() {
        TranslateVisitor vis = new TranslateVisitor(new Pair(table.first, table.second), frameFactory);
        program.accept(vis);
        return vis.getResult();
    }

}
