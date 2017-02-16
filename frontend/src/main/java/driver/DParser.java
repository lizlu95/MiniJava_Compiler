package driver;

import ast.Program;
import parser.Parser;

import java.io.File;

public class DParser {

    /**
     * Given a source file, compile it and write the parse tree to System.out.
     *
     * @param program program to compile.
     */
    public static void compile(File program) throws Exception {
        Program p = Parser.parse(program);
        System.out.println("Parse tree:");
        System.out.println(p.dump());
    }

    /**
     * @param args
     */
    public static void main(String[] args) {
        String program = args[0];
        try {
            compile(new File(program));
        } catch (Exception e) {
            System.out.println("Compilation problem");
            e.printStackTrace();
        }
    }

}
