package driver;

import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;

import java.io.File;
import java.io.IOException;

import translate.Fragments;
import translate.Translator;
import util.IndentingWriter;

import codegen.Assembly;
import codegen.CodeGenerator;

import analysis.RegAlloc;


/**
 * The compiler...
 *
 * @author kdvolder
 */
public class Compiler {

    private CodeGenerator codegenerator = new CodeGenerator();

    /**
     * This determines the target architecture. The "default" implementation
     * is X86. Override to emit code for a different target architecture (this
     * works in theory only, not tested :-)
     */
    protected Frame getFrameFactory() {
        return X86_64Frame.factory;
    }

    /**
     * Given a source file, compile it and write assembly code into
     * another file.
     *
     * @param program  program to compile.
     * @param assemOut where to write the assembly code.
     */
    public void compile(File program, File assemOut) throws Exception {
        Fragments irCode = Translator.translate(getFrameFactory(), program);
        compileIR(assemOut, irCode);
    }

    public void compile(String program, File assemOut) throws Exception {
        Fragments irCode = Translator.translate(getFrameFactory(), program);
        compileIR(assemOut, irCode);
    }

    private void compileIR(File assemOut, Fragments irCode) throws IOException {
        Assembly assembly = codegenerator.apply(irCode);
        RegAlloc.doit(assembly);
        IndentingWriter out = new IndentingWriter(assemOut);
        try {
            assembly.dump(out);
        } finally {
            out.close();
        }
    }

}
