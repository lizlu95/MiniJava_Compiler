package test.typechecker;


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
 * Created by Robin,Liz on 3/12/2017.
 */
public class MJTypeCheckTest {

    @Test
    public void testSampleCode() throws Exception {
        File[] sampleFiles = SampleCode.sampleFiles("java");
        for (int i = 0; i < sampleFiles.length; i++) {
            System.out.println("parsing: " + sampleFiles[i]);
            accept(sampleFiles[i]);
        }
    }

    //INVALID only main with print
    //can only print integer
    @Test
    public void badMainWithPrint() throws Exception {
        expectError("class Main {\n" +
                "\tpublic static void main(String[]args){\n" +
                "\t\tSystem.out.println(true);\n" +
                "\t}\n" +
                "}");
    }

    //only main with print
    @Test
    public void goodMainWithPrint() throws Exception {
        accept("class Main {\n" +
                "\tpublic static void main(String[]args){\n" +
                "\t\tSystem.out.println(1);\n" +
                "\t}\n" +
                "}");
    }

    @Test
    public void mainWithIf() throws Exception {
        accept("class Main{\n" +
                "\tpublic static void main(String[] args) {\n" +
                "\t\tif(1<2) System.out.println(1);\n" +
                "\t\telse System.out.println(2);\n" +
                "\t}\n" +
                "}");
    }

    @Test
    public void mainWithWhile() throws Exception {
        accept("class Main{\n" +
                "\tpublic static void main(String[] args) {\n" +
                "\t\twhile(!(3<2)) System.out.println(1);\n" +
                "\t}\n" +
                "}");
    }

    @Test
    public void mainWithMoreStatements() throws Exception {
        accept("class Main{\n" +
                "\tpublic static void main(String[] args) {\n" +
                "\t\t{\n" +
                "\t\twhile(!(3<2)) System.out.println(2);\n" +
                "\t\tSystem.out.println(1);\n" +
                "\t\t}\n" +
                "\t}\n" +
                "}");
    }

    //shouldn't be allowed to use main args
    @Test
    public void usingMainArgs() throws Exception {
        expectError("class Main {\n" +
                "\tpublic static void main(String[]args){\n" +
                "\t\t args[0] = 1;\n" +
                "\t}\n" +
                "}");
        expectError("class Main {\n" +
                "\tpublic static void main(String[]args){\n" +
                "\t\tSystem.out.println(args);\n" +
                "\t}\n" +
                "}\n");
    }

    //main with one empty class
    @Test
    public void oneClassNoMethods() throws Exception {
        accept("class Main {\n" +
                "\tpublic static void main(String[]args){\n" +
                "\t\tSystem.out.println(1);\n" +
                "\t}\n" +
                "}\n" +
                "class A {\n" +
                "\t\n" +
                "}");
    }

    //one class with methods
    @Test
    public void oneClassWithMethods() throws Exception {
        //one method without param
        accept("class Main{\n" +
                "\tpublic static void main(String[] args) {\n" +
                "\t\tSystem.out.println(1);\n" +
                "\t}\n" +
                "}\n" +
                "class A{\n" +
                "\tint x;\n" +
                "\tboolean y;\n" +
                "\tint[] a;\n" +
                "\tpublic int foo(){\n" +
                "\t\tint vx;\n" +
                "\t\tboolean vy;\n" +
                "\t\tint[] va;\n" +
                "\t\tx = 3;\n" +
                "\t\tvx = 4;\n" +
                "\t\ta[0] = 1;\n" +
                "\t\ty = true;\n" +
                "\t\tvy = false;\n" +
                "\t\tva[0] = 2;\n" +
                "\t\treturn x;\n" +
                "\t}\n" +
                "}\n");
        //one method with param
        accept("class Main{\n" +
                "\tpublic static void main(String[] args) {\n" +
                "\t\tSystem.out.println(1);\n" +
                "\t}\n" +
                "}\n" +
                "class A{\n" +
                "\tint x;\n" +
                "\tboolean y;\n" +
                "\tint[] a;\n" +
                "\tpublic int foo(int x1,boolean y1,int[] a1){\n" +
                "\t\tx = x1;\n" +
                "\t\ty = y1;\n" +
                "\t\ta = a1;\n" +
                "\t\treturn x;\n" +
                "\t}\n" +
                "}\n");
//        //two methods with call
//        accept("class Main{\n" +
//                "\tpublic static void main(String[] args) {\n" +
//                "\t\tSystem.out.println(1);\n" +
//                "\t}\n" +
//                "}\n" +
//                "class A{\n" +
//                "\tint x;\n" +
//                "\tboolean y;\n" +
//                "\tint[] a;\n" +
//                "\tpublic int foo(int x1,boolean y1){\n" +
//                "\t\tx = x1;\n" +
//                "\t\ty = y1;\n" +
//                "\t\treturn x;\n" +
//                "\t}\n" +
//                "\tpublic boolean bar(int x){\n" +
//                "\t\tif(this.foo(3,4)<3)\n" +
//                "\t\t\ty=true;\n" +
//                "\t\telse y=false;\n" +
//                "\t\treturn y;\n" +
//                "\t}\n" +
//                "}");
//        //overloading
//        expectError("class Main{\n" +
//                "\tpublic static void main(String[] args) {\n" +
//                "\t\tSystem.out.println(1);\n" +
//                "\t}\n" +
//                "}\n" +
//                "class A(){\n" +
//                "\tint x;\n" +
//                "\tboolean y;\n" +
//                "\tint[] a;\n" +
//                "\tpublic int foo(int x1,boolean y1){\n" +
//                "\t\tx = x1;\n" +
//                "\t\ty = y1;\n" +
//                "\t\treturn x;\n" +
//                "\t}\n" +
//                "\tpublic int foo(int x1){\n" +
//                "\t\tx = x1;\n" +
//                "\t\treturn y;\n" +
//                "\t}\n" +
//                "}");
    }

    //two classes with methods
    @Test
    public void twoClasses() throws Exception {
        // no extends, calling method in another class
        accept("class Main{\n" +
                "\tpublic static void main(String[] args) {\n" +
                "\t\tSystem.out.println(1);\n" +
                "\t}\n" +
                "}\n" +
                "class A{\n" +
                "\tint x;\n" +
                "\tboolean y;\n" +
                "\tint[] a;\n" +
                "\tpublic int foo(int x1,boolean y1){\n" +
                "\t\tx = x1;\n" +
                "\t\ty = y1;\n" +
                "\t\treturn x;\n" +
                "\t}\n" +
                "}\n" +
                "class B{\n" +
                "\tA a;\n" +
                "\tpublic int foo(int x1,boolean y1){\n" +
                "\t\ta = new A();\n" +
                "\t\treturn a.foo(x1,y1);\n" +
                "\t}\n" +
                "\tpublic boolean bar(int x){\n" +
                "\t\tif(this.foo(3,4)<3)\n" +
                "\t\t\ty=true;\n" +
                "\t\telse y=false;\n" +
                "\t\treturn y;\n" +
                "\t}\n" +
                "}");
        //with extends and override
        accept("class Main{\n" +
                "\tpublic static void main(String[] args) {\n" +
                "\t\tSystem.out.println(1);\n" +
                "\t}\n" +
                "}\n" +
                "class A{\n" +
                "\tint x;\n" +
                "\tboolean y;\n" +
                "\tint[] a;\n" +
                "\tpublic int foo(int x1,boolean y1){\n" +
                "\t\tx = x1;\n" +
                "\t\ty = y1;\n" +
                "\t\treturn x;\n" +
                "\t}\n" +
                "}\n" +
                "class B extends A{\n" +
                "\tA a;\n" +
                "\tpublic int foo(int x1,boolean y1){\n" +
                "\t\treturn x1;\n" +
                "\t}\n" +
                "\tpublic boolean bar(int x){\n" +
                "\t\t{\n" +
                "\t\t\ta = new B();\n" +
                "\t\t\tif(a.foo(3,4)<3)\n" +
                "\t\t\t\ty=true;\n" +
                "\t\t\telse y=false;\n" +
                "\t\t}\n" +
                "\t\treturn y;\n" +
                "\t}\n" +
                "}");
        //with extends no override
        accept("class Main{\n" +
                "\tpublic static void main(String[] args) {\n" +
                "\t\tSystem.out.println(1);\n" +
                "\t}\n" +
                "}\n" +
                "class A{\n" +
                "\tint x;\n" +
                "\tboolean y;\n" +
                "\tint[] a;\n" +
                "\tpublic int foo(int x1,boolean y1){\n" +
                "\t\tx = x1;\n" +
                "\t\ty = y1;\n" +
                "\t\treturn x;\n" +
                "\t}\n" +
                "}\n" +
                "class B extends A{\n" +
                "\tA a;\n" +
                "\tpublic boolean bar(int x){\n" +
                "\t\t{\n" +
                "\t\t\ta = new B();\n" +
                "\t\t\tif(a.foo(3,4)<3)\n" +
                "\t\t\t\ty=true;\n" +
                "\t\t\telse y=false;\n" +
                "\t\t}\n" +
                "\t\treturn y;\n" +
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
			System.out.println(e.getFirstMessage());
        } catch (Exception ex) {
//            System.out.println(ex);
            typeCheckError = false;
        }

        Assertions.assertTrue(typeCheckError);
    }
}
