package test.parser;

import ast.Program;
import org.junit.jupiter.api.Test;
import parser.Parser;
import util.SampleCode;

import java.io.File;


/**
 * The tests in this class correspond more or less to the work in Chapter 3.
 * <p>
 * These tests try to call your parser to parse Expression programs, but they do
 * not check the AST produced by the parser. As such you should be able to get
 * these tests to pass without inserting any semantic actions into your
 * parser specification file.
 * <p>
 * The tests in this file are written in an order that can be followed if
 * you want to develop your parser incrementally, staring with the tests at the
 * top of the file, and working your way down.
 *
 * @author kdvolder
 */
public class Test3Parse {

    /**
     * All testing is supposed to go through calling this method to one of the
     * accept methods, to see whether some input is accepted by the parser. The subclass
     * Test4Parse refines these tests by overriding this accept method to also verify the
     * parse tree structure.
     */
    protected void accept(String input) throws Exception {
        Program p = Parser.parse(input);
        System.out.println(p.dump());
    }

    protected void accept(File file) throws Exception {
        System.out.println("parsing file: " + file);
        Program p = Parser.parse(file);
        System.out.println(p.dump());
    }

    //////////////////////////////////////////////////////////////////////////
    // First let's ensure we can parse the "simplest possible" program:

    @Test
    public void simpleProgram() throws Exception {
        accept("class Main {\n" +
                "  public static void main(String[] args) { {} }\n" +
                "}"
        );
    }

    @Test
    public void printNumber() throws Exception {
        accept("class Main {\n" +
                "  public static void main(String[] args) {\n" +
                "      System.out.println(10);\n" +
                "  }\n" +
                "}"
        );
    }

    @Test
    public void printSum() throws Exception {
        accept("class Main {\n" +
                "  public static void main(String[] args) {\n" +
                "      System.out.println(10+20);\n" +
                "  }\n" +
                "}"
        );
    }

    @Test
    public void simpleMethod() throws Exception {
        accept("class Main {\n" +
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
        accept("class Main {\n" +
                "  public static void main(String[] args) {\n" +
                "      System.out.println(new Foo().getFoo());\n" +
                "  }\n" +
                "}\n" +
                "class Foo {\n " +
                "   public int getFoo() { return 78; }\n" +
                "}"
        );
        accept("class Main {\n" +
                "  public static void main(String[] args) {\n" +
                "      System.out.println(5);\n" +
                "  }\n" +
                "}\n" +
                "class Foo {\n " +
                "   public int getFoo() { return 78; }\n" +
                "}"
        );
    }

    @Test
    public void callSimpleMethodWithArgs() throws Exception {
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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

        //test if support more than one left recursion
        accept("class Main {\n" +
                "  public static void main(String[] args) {\n" +
                "      System.out.println(new Foo().do());\n" +
                "  }\n" +
                "}\n" +
                "class Foo {\n " +
                "   public int do() { \n" +
                "      int[] arr;\n" +
                "      arr = new int[5].length.length;\n" +
                "      return true.length.length[arr.length];\n" +
                "   }\n" +
                "}"
        );
    }

    @Test
    public void arrays() throws Exception {
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
                "  public static void main(String[] args) {\n" +
                "      System.out.println(A.B(c,d));\n" +
                "  }\n" +
                "}\n"
        );
    }

    @Test
    public void printWhile() throws Exception {
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
    public void ifThenElse() throws Exception
    {
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
                "  public static void main(String[] args) { {\n" +
                "      System.out.println(new Foo().doit(10,20));\n" +
                "      System.out.println(new Foo().doit(20,10));\n" +
                "  } }\n" +
                "}\n" +
                "class Foo {\n " +
                "   public int doit(int x, int y) {\n" +
                "      int result;\n" +
                "      if (this.ordered(x, y))\n" +
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
        accept("class Main {\n" +
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
                "      while (count<x) {\n" +
                "          result = result + count;\n" +
                "          count = count + 1;\n" +
                "      }\n" +
                "      return result;\n" +
                "   }\n" +
                "}"
        );
    }


    @Test
    public void field() throws Exception {
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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
                "}"
        );
    }

    @Test
    public void emptyBranches() throws Exception {
        //This test is good to see if the BasicBlocks / TraceScheduler deal well
        //with "empty" basic blocks (they do *not* => inefficient jumps)
        //Challenge problem: inspect the code after TraceScheduling and try to fix
        //the compiler somehow to produce more optimal code.
        accept("class Main {\n" +
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
        accept("class Main {\n" +
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


    /////////////////////////////////////////////////////////////////////////////////
    // Finally, check whether the parser accepts all the sample code.
    @Test
    public void  testParseSampleCode() throws Exception {
        File[] files = SampleCode.sampleFiles("java");
        for (File file : files) {
            accept(file);
        }
    }

}
