class Inc{
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class Test {
    int a;
    public int do() {
	int i;
	boolean odd;
	odd = false;
	i = 0;
	while (i < 10) {
	    if (odd){
		a = a + 1;
	    } else {
		a = a * 2;
	    }
	    odd = !odd;
	    i = i + 1;
	}
	return a;
    }
}
