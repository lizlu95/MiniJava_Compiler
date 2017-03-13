package test.typechecker;


import ast.Type;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import parser.jcc.ParseException;
import typechecker.ErrorMessage;
import typechecker.TypeChecker;
import typechecker.TypeCheckerException;

import java.io.File;

import static parser.Parser.parseExp;

/**
 * Created by Robin on 3/12/2017.
 */
public class MJTypeCheckTest {
    ///////////////////////////
    // minijava
    //////////////////////////

    @Test
    public void simplestProgramPossible() throws Exception {
        accept("class Main {\n" +
                "\tpublic static void main(String[]args){\n" +
                "\t\tSystem.out.println( true );\n" +
                "\t}\n" +
                "}");
    }

    // /////////////////////// Helpers
    // /////////////////////////////////////////////

    private ErrorMessage typeError(String exp, Type expected, Type actual)
            throws ParseException {
        return ErrorMessage.typeError(parseExp(exp), expected, actual);
    }

    private void accept(File file) throws TypeCheckerException, Exception {
        TypeChecker.parseAndCheck(file);
    }

    private void accept(String string) throws TypeCheckerException, Exception {
        TypeChecker.parseAndCheck(string);
    }

    /**
     * Mostly what we want to do in this set of unit tests is see whether the
     * checker produces the right kind of error reports. This is a helper method
     * to do just that.
     */
    private void expect(ErrorMessage expect, String input) throws Exception {

        expectError(input);
//		try {
//			TypeChecker.parseAndCheck(input);
//			Assert.fail("A TypeCheckerException should have been raised but was not.");
//		} catch (TypeCheckerException e) {
//			Assert.assertEquals(expect, e.getFirstMessage());
//		}
    }

    private void expectError(String input) throws Exception {
        boolean typeCheckError = false;
        try {
            TypeChecker.parseAndCheck(input);
        } catch (TypeCheckerException e) {
            typeCheckError = true;
//			System.out.println(e.getFirstMessage());
        } catch (Exception ex) {
            System.out.println(ex);
            typeCheckError = false;
        }

        Assertions.assertTrue(typeCheckError);
    }
}
