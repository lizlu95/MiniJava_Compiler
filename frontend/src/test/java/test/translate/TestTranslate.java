package test.translate;

import ir.frame.Frame;
import ir.frame.x86_64.X86_64Frame;
import ir.interp.Interp;
import ir.interp.InterpMode;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import translate.Fragment;
import translate.Fragments;
import translate.Translator;
import typechecker.TypeCheckerException;
import util.SampleCode;
import util.Utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

/**
 * Test the minijava translation phase that takes a (type-checked) program and turns
 * the bodies of all the methods in the program into IRtrees.
 * <p>
 * This test suite uses the IR interpreter to simulate the execution of the
 * resulting IR. This gives us some confidence that our translation works correctly :-)
 *
 * @author kdvolder
 */
public class TestTranslate {

    public static final Frame architecture = X86_64Frame.factory;

    /**
     * To make it easy to run all of these tests with the either
     * linearized ir code, basic blocks or trace scheduled code
     * We determine the simulation mode via this method.
     * <p>
     * Simply creating a subclass and overriding this method will create
     * a test suite that runs all the same tests in a different simulation
     * mode.
     *
     * @return
     */
    protected InterpMode getSimulationMode() {
        return InterpMode.LINEARIZED_IR;
    }

    /**
     * Print out all the generated IR?
     * <p>
     * If false, only the result of simulating the IR execution
     * will be printed.
     */
    protected boolean dumpIR() {
        return true;
    }

    /**
     * Print out all the generated IR to a file
     */
    protected boolean dumpIRToFile() {
        return true;
    }

    @Test
    public void simpleProgram() throws Exception {
        test("",
                "class Main {\n" +
                        "  public static void main(String[] args) { {} }\n" +
                        "}"
        );
    }

    @Test
    public void printNumber() throws Exception {
        test("10\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(10);\n" +
                        "  }\n" +
                        "}"
        );
    }

    @Test
    public void printSum() throws Exception {
        test("30\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(10+20);\n" +
                        "  }\n" +
                        "}"
        );
    }

    @Test
    public void simpleMethod() throws Exception {
        test("",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      {}\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int getFoo() { return 0; }\n" +
                        "}"
        );
    }

    @Test
    public void callSimpleMethod() throws Exception {
        test("78\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().getFoo());\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int getFoo() { return 78; }\n" +
                        "}"
        );
    }

    @Test
    public void callSimpleMethodWithArgs() throws Exception {
        test("1697\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().sum(14,17));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int sum(int x, int y) { return x+y*99; }\n" +
                        "}"
        );
    }

    @Test
    public void simpleMethodArgsAndLocals() throws Exception {
        test("1711\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().sum(14,17));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int sum(int x, int y) { \n" +
                        "       int tmp;\n" +
                        "       int tmp2;\n" +
                        "       tmp = y*99;\n" +
                        "       tmp2 = x*2;\n" +
                        "       return tmp+tmp2;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void and() throws Exception {
        test("1\n99\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().do(true,true));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int do(boolean a, boolean b) { \n" +
                        "      if (a && b)\n" +
                        "         System.out.println(1);\n" +
                        "      else \n" +
                        "         System.out.println(0);\n" +
                        "      return 99;\n" +
                        "   }\n" +
                        "}"
        );

    }

    @Test
    public void simpleArrays() throws Exception {
        test("99\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().do());\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int do() { \n" +
                        "      int[] arr;\n" +
                        "      arr = new int[1];\n" +
                        "      arr[0] = 99;\n" +
                        "      return arr[0];\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void arrays() throws Exception {
        test((17 + 2 * 17 + 2) + "\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().getSet(new int[2],17));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int getSet(int[] arr, int y) { \n" +
                        "      arr[0] = y;\n" +
                        "      arr[1] = 2*arr[0];\n" +
                        "      return arr[0]+arr[1]+arr.length;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void complexArrays() throws Exception {
        test(20 + "\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().do(2));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   int [] arr;\n" +
                        "   public int do(int y) { \n" +
                        "      return this.n(5)[0] + this.n(15)[0];\n" +
                        "   }\n" +
                        "   public int [] n(int n) { \n" +
                        "      arr = new int[n];\n" +
                        "	   arr[0] = n;\n" +
                        "      return arr;\n" +
                        "   }\n" +
                        "}");
    }

    @Test
    public void printArg() throws Exception {
        test("10\n10\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().parg(10));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int parg(int arg) { \n" +
                        "      System.out.println(arg);\n" +
                        "      return arg;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void printWhile() throws Exception {
        test("5\n4\n3\n2\n1\n0\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().warg(5));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int warg(int arg) { \n" +
//				"      System.out.println(901);\n" +
                        "      while (0<arg) {\n" +
//				"         System.out.println(902);\n" +
                        "         System.out.println(arg);\n" +
                        "         arg = arg - 1;\n" +
                        "      }\n" +
//				"      System.out.println(903);\n" +
                        "      return arg;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void whileFac() throws Exception {
        test("24\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().fac(4));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int fac(int n) { \n" +
                        "      int fac;\n" +
                        "      int i;\n" +
                        "      i = n; fac = 1; \n" +
                        "      while (0<i) { fac = fac*i; i = i-1; } \n" +
                        "      return fac;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void arrayLoop() throws Exception {
        test((11 * 10 / 2) + "\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Foo().doit(new int[10]));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int doit(int[] arr) { \n" +
                        "      int dum;\n" +
                        "      dum = this.init(arr);\n" +
                        "      return this.sum(arr);\n" +
                        "   }\n" +
                        "   public int init(int[] arr) {\n" +
                        "      int i;\n" +
                        "      i = 0;\n" +
                        "      while (i < arr.length) {\n" +
                        "         arr[i] = i+1;\n" +
                        "         i = i + 1;\n" +
                        "      }\n" +
                        "      return 0;\n" +
                        "   }\n" +
                        "   public int sum(int[] arr) {\n" +
                        "      int i;\n" +
                        "      int sum;\n" +
                        "      i = 0; sum = 0;\n" +
                        "      while (i < arr.length) {\n" +
                        "         sum = sum + arr[i];\n" +
                        "         i = i + 1;\n" +
                        "      }\n" +
                        "      return sum;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void ifThenElse() throws Exception {
        test("20\n20\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      { System.out.println(new Foo().max(10,20));\n" +
                        "        System.out.println(new Foo().max(20,10));\n" +
                        "      }\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int max(int x, int y) { \n" +
                        "      int tmp;\n" +
                        "      if (x<y) tmp = y; else tmp = x;\n" +
                        "      return tmp;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void not() throws Exception {
        test("20\n20\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      { System.out.println(new Foo().max(10,20));\n" +
                        "        System.out.println(new Foo().max(20,10));\n" +
                        "      }\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int max(int x, int y) { \n" +
                        "      int tmp;\n" +
                        "      if (!(y<x)) tmp = y; else tmp = x;\n" +
                        "      return tmp;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void not2() throws Exception {
        test("20\n20\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      { System.out.println(new Foo().max(10,20));\n" +
                        "        System.out.println(new Foo().max(20,10));\n" +
                        "      }\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int max(int x, int y) { \n" +
                        "      int tmp; boolean flag;\n" +
                        "      flag = y < x;\n" +
                        "      flag = !flag;\n" +
                        "      if (flag) tmp = y; else tmp = x;\n" +
                        "      return tmp;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void not3() throws Exception {
        test("20\n20\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      { System.out.println(new Foo().max(10,20));\n" +
                        "        System.out.println(new Foo().max(20,10));\n" +
                        "      }\n" +
                        "  }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int max(int x, int y) { \n" +
                        "      int tmp; boolean flag;\n" +
                        "      flag = y < x;\n" +
                        "      if (!flag) tmp = y; else tmp = x;\n" +
                        "      return tmp;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void flag() throws Exception {
        test("99\n22\n",
                "class Main {\n" +
                        "  public static void main(String[] args) { {\n" +
                        "      System.out.println(new Foo().doit(10,20));\n" +
                        "      System.out.println(new Foo().doit(20,10));\n" +
                        "  } }\n" +
                        "}\n" +
                        "class Foo {\n " +
//                        "   int z;\n"+
                        "   public int doit(int x, int y) {\n" +
                        "      int result;\n" +
//                        "      boolean r;\n" +
//                        "       result = 1;" +
//                        "       result = 2;" +
//                        "      r = this.ordered(x,y);\n"+
//                        "      System.out.println(r);\n"+
//                        "       r=true;"+
//                        "      if (r)\n" +
                        "       if(this.ordered(x,y))"+
                        "         result = 99;\n" +
                        "      else\n" +
                        "         result = 22;\n" +
                        "      return result;\n" +
                        "   }\n" +
                        "   public boolean ordered(int x, int y) { \n" +
                        "      return x<y;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void whileLoop() throws Exception {
        test((10 * 9 / 2) + "\n",
                "class Main {\n" +
                        "  public static void main(String[] args) { {\n" +
                        "      System.out.println(new Foo().doit(10));\n" +
                        "  } }\n" +
                        "}\n" +
                        "class Foo {\n " +
                        "   public int doit(int x) {\n" +
                        "      int result;\n" +
                        "      int count;\n" +
                        "      result = 0;\n" +
                        "      count = 1;\n" +
//                        "      System.out.println(x);\n"+
                        "      while (count<x) {\n" +
                        "          result = result + count;\n" +
                        "          count = count + 1;\n" +
                        "      }\n" +
//                        "      System.out.println(count);\n"+
                        "      return result;\n" +
                        "   }\n" +
                        "}"
        );

    }


    @Test
    public void field() throws Exception {
        test("50\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Point().doit());\n" +
                        "  }\n" +
                        "}\n" +
                        "class Point {\n " +
                        "   int x; int y;\n" +
                        "   public int doit() {\n" +
                        "      x = 10;\n" +
                        "      y = 20;\n" +
                        "      return x+2*y;\n" +
                        "   }\n" +
                        "}"
        );

    }

    @Test
    public void invokefield() throws Exception {
        test("10\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Point().doit());\n" +
                        "  }\n" +
                        "}\n" +
                        "class Point {\n " +
                        "   int x; int y;\n" +
                        "   Point p;\n" +
                        "   public int donothing() {\n" +
                        "      return 10;\n" +
                        "   }\n" +
                        "\n" +
                        "   public int doit() {\n" +
                        "      x = 10;\n" +
                        "      y = 20;\n" +
                        "      p = new Point();\n" +
                        "      return p.donothing();\n" +
                        "   }\n" +
                        "}"
        );

    }

    @Test
    public void separateObjs() throws Exception {
        test("1\n2\n10\n20\n0\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Test().doit());\n" +
                        "  }\n" +
                        "}\n" +
                        "class Test {\n" +
                        "   public int doit() {\n" +
                        "      Point p1; Point p2;\n" +
                        "      int ignore;\n" +
                        "      p1 = new Point().init(1,2);\n" +
                        "      p2 = new Point().init(10,20);\n" +
                        "      ignore = p1.print();\n" +
                        "      return p2.print();\n" +
                        "   }\n" +
                        "}\n" +
                        "class Point {\n" +
                        "   int x; int y;\n" +
                        "   public Point init(int ix, int iy) {\n" +
                        "      x = ix;\n" +
                        "      y = iy;\n" +
                        "      return this;\n" +
                        "   }\n" +
                        "   public int print() {\n" +
                        "      System.out.println(x);\n" +
                        "      System.out.println(y);\n" +
                        "      return 0;\n" +
                        "   }\n" +
                        "}"
        );
    }

    @Test
    public void complexBranches() throws Exception {
        //Trying to create a program that has many choices... so many traces.
        //We want to work the trace schedule to a point where it actually
        //gets driven into some of the rarer cases.
        test("1\n7\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Test().doit());\n" +
                        "  }\n" +
                        "}\n" +
                        "class Test {\n" +
                        "   int count;\n" +
                        "   public boolean cond() {\n" +
                        "      count = count + 1;\n" +
                        "      return true;\n" +
                        "   }\n" +
                        "   public int doit() {\n" +
                        "     boolean a;\n" +
                        "     a = this.cond() && this.cond() && this.cond();\n" +
                        "     if (a && this.cond() && this.cond() && this.cond() && this.cond())\n" +
                        "        System.out.println(1);" +
                        "     else\n" +
                        "        System.out.println(0);" +
                        "     return count;\n" +
                        "   }\n" +
                        "}");
    }

    @Test
    public void emptyBranches() throws Exception {
        //This test is good to see if the BasicBlocks / TraceScheduler deal well
        //with "empty" basic blocks (they do *not* => inefficient jumps)
        //Challenge problem: inspect the code after TraceScheduling and try to fix
        //the compiler somehow to produce more optimal code.
        test("9999\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Test().test(true));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Test {\n" +
                        "  public int test(boolean flag) {\n" +
                        "     if (flag) {} else {}\n" +
                        "     return 9999;\n" +
                        "  }\n" +
                        "}");
    }

    @Test
    public void emptyElseBranch() throws Exception {
        //This test is good to see if the BasicBlocks / TraceScheduler deal well
        //with "empty" basic blocks (they do not => inefficient jumps)
        //Challenge problem: inspect the code after TraceScheduling and try to fix
        //the compiler somehow to produce more optimal code.
        test("99\n9999\n",
                "class Main {\n" +
                        "  public static void main(String[] args) {\n" +
                        "      System.out.println(new Test().test(true));\n" +
                        "  }\n" +
                        "}\n" +
                        "class Test {\n" +
                        "  public int test(boolean flag) {\n" +
                        "      if (true) System.out.println(99); else {}\n" +
                        "      return 9999;\n" +
                        "  }\n" +
                        "}");
    }

    //////////////// Sample code //////////////////////////////////

    @Test
    public void testSampleCode() throws Exception {
        File[] files = SampleCode.sampleFiles("java");
        for (int i = 0; i < files.length; i++) {
            File f = files[i];
            if (!optionalSample(f))
                test(f);
        }
    }

    @Test // Don't run this unless you are implementing inheritance support!
    public void testOptionalSampleCode() throws Exception {
        File[] files = SampleCode.sampleFiles("java");
        for (int i = 0; i < files.length; i++) {
            File f = files[i];
            if (optionalSample(f))
                test(f);
        }
    }

    protected Fragments test(File program) throws TypeCheckerException, Exception {
        System.out.println("Translating: " + program);
        System.out.println(Utils.getContents(program));
        String expected = Utils.getExpected(program);
        String otherexpected = Utils.getOtherExpected(program);
        if (otherexpected != null) {
            return test(expected, otherexpected, program);
        } else {
            return test(expected, program);
        }
    }

    protected Fragments translate(File program) throws TypeCheckerException, Exception {
        Fragments translated = Translator.translate(architecture, program);
        if (dumpIR()) {
            System.out.println("VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
            System.out.println(translated);
            System.out.println();
        }
        if (dumpIRToFile()) {
            String iroutname = Utils.changeSuffix(program, "ir");
            File irout = new File(iroutname);
            BufferedWriter irouts = new BufferedWriter(new FileWriter(irout));

            for (Fragment f : translated) {
                irouts.write(f.toString());
                irouts.write("\n");
            }
            irouts.close();
        }
        return translated;
    }

    protected String run(Fragments translated) {
        String result = null;
        if (getSimulationMode() != null) {
            System.out.println("Simulating IR code:");
            Interp interp = new Interp(translated, getSimulationMode());

            try {
                result = interp.run();
            } catch (Error e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
                result = e.getMessage();
            }
        }
        return result;
    }

    protected Fragments test(String expected, File program)
            throws TypeCheckerException, Exception {
        Fragments translated = translate(program);
        if (getSimulationMode() != null) {
            String result = run(translated);
            System.out.println(result);
            Assertions.assertEquals(expected, result);
        }
        System.out.println("=================================");
        return translated;
    }

    protected Fragments test(String expected, String otherexpected, File program)
            throws TypeCheckerException, Exception {
        Fragments translated = translate(program);
        if (getSimulationMode() != null) {
            String result = run(translated);
            System.out.println(result);
            Assertions.assertTrue(expected.equals(result) ||
                    otherexpected.equals(result));
        }
        System.out.println("=================================");
        return translated;
    }

    private boolean optionalSample(File f) {
        return f.toString().endsWith("Visitor.java");
    }

    protected Fragments test(String expected, String program) throws Exception {
        System.out.println("Translating program: ");
        System.out.println(program);
        Fragments translated = Translator.translate(architecture, program);
        if (dumpIR()) {
            System.out.println("VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
            System.out.println(translated);
            System.out.println();
        }
        if (getSimulationMode() != null) {
            System.out.println("Simulating IR code:");
            Interp interp = new Interp(translated, getSimulationMode());
            String result = interp.run();
            System.out.print(result);
            Assertions.assertEquals(expected, result);
        }
        System.out.println("=================================");
        return translated;
    }

}
