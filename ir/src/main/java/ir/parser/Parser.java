package ir.parser;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

import translate.Fragments;
import translate.ProcFragment;

import ir.parser.IRParser;
import ir.parser.ParseException;

/**
 * Instead of calling methods in the JavaCC (or maybe SableCC) generated
 * parser directly. We use this class as a kind of Stub class to isolate us from
 * direct dependency on the generated parser.
 * <p>
 * In theory this means you should be able to replace the parser
 * with another implementation by editing these methods, and without
 * changing the main implementation for the rest of the compiler.
 * <p>
 * It also has the benefit of not mixing in utility methods with
 * the generated code. We can put different methods for calling the parser
 * (with a file, an inputstream, a String ect. in here).
 * <p>
 * Note: Actually, there is a dependency on the ParseException class generated
 * by JavaCC. To really get "plugability" we should not have this dependency.
 *
 * @author kdvolder
 */
public class Parser {

    /**
     * Read input from a File and parse it into a list of IR.
     */
    public static Fragments parse(File file) throws IOException, ParseException {
        FileReader input = new FileReader(file);
        try {
            return parse(input);
        } finally { //No matter what happens, always close the file!
            input.close();
        }
    }

    /**
     * Read input from a java.io.Reader and parse it into an AST. It is the
     * caller's responsibility to close the Reader.
     */
    public static Fragments parse(Reader input) throws ParseException {
        IRParser parser = new IRParser(input);
        return parser.Fragments();
    }

    /**
     * Read input directly from a String and parse it into an AST.
     */
    public static Fragments parse(String inputText) throws ParseException {
        return parse(new StringReader(inputText));
    }
}
