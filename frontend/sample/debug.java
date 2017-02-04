class Debug {
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class Test {
    public int do() {
	boolean debug;
	int j;
	j = 23;
	j = j * j;
	debug = true;
	if (debug) {
	    System.out.println(1);
	} else {
	}
	return j;
    }
}
