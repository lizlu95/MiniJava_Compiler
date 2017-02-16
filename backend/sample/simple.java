class Simple{
    public static void main(String[] a){
	System.out.println(new Test().do(6));
    }
}

class Test {
    public int do(int a) {
	System.out.println(a);
	return a;
    }
}
