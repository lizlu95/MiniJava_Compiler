class Liveness {
    public static void main(String[] a){
	System.out.println(new Test().do(6));
    }
}

class Test {
    public int do(int x) {
	int i;
	int j;
	while (3 < x) {
	    i = 0;
	    j = x * 5;
	    x = x - 2;
	}
	return 6;
    }
}
