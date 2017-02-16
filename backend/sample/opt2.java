class Opt {
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class Test {
    public int do() {
	int i;
	int k;
	i = 0;
	k = 0;
	while (i < 10) {
	    i = i + 1;
	    k = k + i;
	}
	return k;
    }
}
