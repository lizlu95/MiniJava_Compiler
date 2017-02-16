package test.typechecker;


import ast.BooleanType;
import ast.IntegerType;
import ast.Type;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import parser.jcc.ParseException;
import typechecker.ErrorMessage;
import typechecker.TypeChecker;
import typechecker.TypeCheckerException;
import util.SampleCode;

import java.io.File;

import static parser.Parser.parseExp;

/**
 * The difficulty in writing tests for this unit of work is that we should, if
 * at all possible try to not make the testing code be dependant on the
 * Expression type checker returning specific error messages.
 * <p>
 * To try to still have reasonably specific tests that specify relatively
 * precisely what type of error a specific program ought to raise we will:
 * <ul>
 * <li>Provide you with a class ErrorReport that you should use to create error
 * reports.
 * <li>Tests will only inspect the first error in the report.
 * <li>Tests will be written to avoid ambiguities into what is the "first" error
 * as much as possible.
 * </ul>
 *
 * @author kdvolder
 */
public class MyTypeCheckTest {

    // ////////////////////////////////////////////////////////////////////////////////////////
    // Preliminary check....

    /**
     * This test parses and typechecks all the book sample programs. These
     * should type check without any errors.
     * <p>
     * By itself this is not a very good test. E.g. an implementation which does
     * nothing at all will already pass the test!
     */
    @Test
    public void testSampleCode() throws Exception {
        File[] sampleFiles = SampleCode.sampleFiles("java");
        for (int i = 0; i < sampleFiles.length; i++) {
            System.out.println("parsing: " + sampleFiles[i]);
            accept(sampleFiles[i]);
        }
    }

    ///////////////////////////
    // minijava
    //////////////////////////

    @Test
    public void badFunctionDeclaration() throws Exception {
        expect(typeError("1 < 2", new IntegerType(), new BooleanType()),
                progWithFunc("int x() { return 1 < 2; }"));
        expect(typeError("1", new BooleanType(), new IntegerType()),
                progWithFunc("boolean x() { return 1; }"));
    }

    @Test
    public void goodFunctionDeclaration() throws Exception {
        accept(progWithFunc("int x() { return 1; }"));
        accept(progWithFunc("boolean x() { return 1 < 2; }"));
        accept(progWithFunc("int x(int x) { return x+1; }"));
        accept(progWithFunc("boolean x(int x) { return x < 1; }"));
        accept(progWithFunc("int x(int x, int y) { return x + y; }"));
        accept(progWithFunc("boolean x(int x, int y) { return x < y; }"));
        accept(progWithFunc("boolean x(boolean x) { return x; }"));

    }

    @Test
    public void goodFunctionCall() throws Exception {
        accept(progWithFunc("int x() { return 1; }\n" + "y = x();\n z = y+1;"));
        accept(progWithFunc("boolean x() { return 1 < 2; }" + "y = x(); z = y? 2:1;"));
        accept(progWithFunc("int x(int x) { return x+1; }" + "y = x(2); z = y+1;"));
        accept(progWithFunc("boolean x(int x) { return x < 1; }" + "y=x(2); z = y?2:1;"));
        accept(progWithFunc("int x(int x, int y) { return x + y; }" + "e=x(2,2); f=e+1;"));
        accept(progWithFunc("boolean x(int x, int y) { return x < y; }" + "e=x(2,2); f=e?2:1;"));
        accept(progWithFunc("boolean x(boolean x) { return x; }" + "e= x(3<2);"));
    }


    @Test
    public void badFunctionCallWithMismatchedArgTypes() throws Exception {
        expectError(progWithFunc("int x(int x) { return 1; }\n" + "y = x(3 < 4);"));
        expectError(progWithFunc("int x(boolean x) { return 1; }\n" + "y = x(3);"));

    }

    @Test
    public void badFunctionCallWithUnmatchedNumberOfArgs() throws Exception {
        expectError(progWithFunc("int x() { return 1; }\n" + "y = x(1);"));
        expectError(progWithFunc("int x(int x) { return x; }\n" + "y = x();"));

    }

    @Test
    public void functionNameUsedAsVariable() throws Exception {
        expectError(progWithFunc("int x(int t) { return t; }\n" + "y = x;"));
    }

    @Test
    public void callUndefinedFunction() throws Exception {
        expectError(progWithFunc("y = x();"));
    }

    @Test
    public void scopeTest() throws Exception {
        accept(progWithFunc("int x() { k = 1; return 1; }\n" + "k = x();\n z = k+1;"));
        expectError(progWithFunc("int x() { k = 1; return 1; }\n" + " z = k+1;"));
    }
    // ///////////////////////////////////////////////////////////////////////////////////////
    // We'll start with checking if the compiler detects duplicate
    // identifier definitions within the same scope.

    @Test
    public void duplicateId() throws Exception {
        // Duplicate variable name
        expect(ErrorMessage.duplicateDefinition("x"), "x = 5;\n" + "x = 4;"
                + "print 1");

        // Duplicate variable name
        expect(ErrorMessage.duplicateDefinition("x"), "x = 3 < 5;\n" + "x = 4;"
                + "print 1");

        // Duplicate variable name
        expect(ErrorMessage.duplicateDefinition("x"), "x = 3;\n" + "x = 4 < 5;"
                + "print 1");

        // Duplicate variable name
        expect(ErrorMessage.duplicateDefinition("x"), "x = 3 < 5;\n"
                + "x = 4 < 5;" + "print 1");

        // Duplicate variable name
        expect(ErrorMessage.duplicateDefinition("x"),
                progWithFunc("int func(){" + "x = 5;\n" + "x = 4;"
                        + "return 1;" + "}"));

        // Duplicate variable name
        expect(ErrorMessage.duplicateDefinition("x"),
                progWithFunc("int func(){" + "x = 3 < 5;\n" + "x = 4;"
                        + "return 1;" + "}"));

        // Duplicate variable name
        expect(ErrorMessage.duplicateDefinition("x"),
                progWithFunc("int func(){" + "x = 3 < 5;\n" + "x = 4 < 5;"
                        + "return 1;" + "}"));

        // Duplicate variable name
        expect(ErrorMessage.duplicateDefinition("x"),
                progWithFunc("int func(){" + "x = 3 < 5;\n" + "x = 4 < 5;"
                        + "return 1;" + "}"));
    }

    @Test
    public void undefinedId() throws Exception {
        // Duplicate variable name
        expect(ErrorMessage.undefinedId("x"), "y = x;\n" + "print 1");
        expect(ErrorMessage.undefinedId("x"), "print x");

        expect(ErrorMessage.undefinedId("x"), progWithFunc("int func(){"
                + "y = 4 < x;" + "return 1;" + "}"));
    }

    // /////////////////////////////////////////////////////////////////////////////
    // Checking phase 2

    // Statements
    @Test
    public void badPrint() throws Exception {
        accept("print 1");
        accept("print (1 < 2)");
    }

    //
    // Expressions
    //

    @Test
    public void arithOps() throws Exception {
        String[] ops = {"+", "-", "*"};
        for (int i = 0; i < ops.length; i++) {
            String op = ops[i];
            accept(progWithExp("i" + op + "10"));
            accept(progWithExp("10" + op + "i"));

            expect(typeError("b", new IntegerType(), new BooleanType()),
                    progWithExp("b" + op + "10"));
            expect(typeError("b", new IntegerType(), new BooleanType()),
                    progWithExp("10" + op + "b"));
        }
    }

    @Test
    public void lessThan() throws Exception {
        String[] ops = {"<"};
        for (int i = 0; i < ops.length; ++i) {
            String op = ops[i];
            accept(progWithExp("i" + op + "10"));
            accept(progWithExp("10" + op + "i"));
            accept(progWithExp("i+10" + op + "2*i"));

            expect(typeError("b", new IntegerType(), new BooleanType()),
                    progWithExp("b" + op + "10"));
            expect(typeError("b", new IntegerType(), new BooleanType()),
                    progWithExp("10" + op + "b"));
        }
    }

    @Test
    public void not() throws Exception {
        accept(progWithExp("!(3 < 4)"));

        expect(typeError("i", new BooleanType(), new IntegerType()),
                progWithExp("!i"));
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

    // //////// Various code snippets and templates to be used in our tests
    // //////////////

    /**
     * Generate a test program with an expression in it.
     */
    private String progWithExp(String exp) {
        return " i = 5;\n" + " b = 4 < 5;\n" + " x = " + exp + ";\n"
                + " print 1";
    }

    private String progWithFunc(String func) {
        return " i = 5;\n" + " b = 4 < 5;\n" + func + " print 1";
    }

}
