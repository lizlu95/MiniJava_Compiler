class Main {
  public static void main(String[] args) { {
      System.out.println(new Foo().doit(10));
  } }
}
class Foo {
    public int doit(int x) {
      int result;
      int count;
      result = 0;
      count = 1;
      while (count<x) {
          result = result + count;
          count = count + 1;
      }
      return result;
   }
}
