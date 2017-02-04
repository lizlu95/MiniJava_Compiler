class Opt {
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class O {
    public int m(int a, boolean b) {
	return 3;
    }
}

class Test {
    public int do() {
	int [] x;
	boolean y;
	O o;
	x = new int[4];
	x[3] = 11;
	y = true;
	o = new O();
	y = x[3] < o.m(6, true) && y;
	return 2;
    }
}

