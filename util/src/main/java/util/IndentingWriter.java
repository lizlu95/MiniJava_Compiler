package util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;

/**
 * A helper class to produce indented output (e.g. for a pretty printer).
 * <p>
 * An instance of this class sends output to a wrapped PrintWriter and keeps
 * track of a level of indentation.
 * It will ensures that an appropriate number of spaces is printed before any
 * actual output on each new line.
 * <p>
 * Note that newlines embedded inside of Strings are not processed by this
 * implementation. You should always use println to insert newlines into
 * the output.
 *
 * @author kdvolder
 */
public class IndentingWriter {

    /**
     * Current level of indentation.
     */
    private int indentation = 0;

    /**
     * This field keeps track of the current column
     */
    private int col = 0;

    /**
     * Where to send the actual output to.
     */
    private PrintWriter out;

    public IndentingWriter(PrintWriter out) {
        this.out = out;
    }

    public IndentingWriter(Writer out) {
        this(new PrintWriter(out));
    }

    public IndentingWriter(OutputStream out) {
        this(new OutputStreamWriter(out));
    }

    public IndentingWriter(File out) throws IOException {
        this(new BufferedWriter(new FileWriter(out)));
    }

    /**
     * Close the wrapped PrintWriter.
     */
    public void close() {
        out.close();
    }

    public void print(String string) {
        if (col == 0) {
            for (int i = 0; i < indentation; i++) {
                out.print("   ");
            }
            col = indentation * 3;
        }
        out.print(string);
        int l = string.lastIndexOf('\n');
        if (l == -1)
            col += string.length();
        else
            col = string.length() - (l + 1);
    }

    public void println() {
        out.println();
        col = 0;
    }

    /**
     * Write an object to this IndentableWriter. If the object implements
     * Indentable, then that implementation will be used. Otherwise we fall back
     * on the object's toString method.
     */
    public void print(Object obj) {
        if (obj instanceof Indentable) {
            Indentable iObj = (Indentable) obj;
            iObj.dump(this);
        } else {
            this.print("" + obj);
        }
    }

    public void println(Object obj) {
        print(obj);
        println();
    }

    public void indent() {
        indentation++;
    }

    public void outdent() {
        indentation--;
    }

    public void tabTo(int toCol) {
        if (col > toCol) println();
        while (col < toCol)
            print(" ");
    }

}
