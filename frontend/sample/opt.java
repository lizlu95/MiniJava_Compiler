class Opt {
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class Test {
    public int do() {
	int i;
	int j;
	int k;
	int one;
	one = 1;
	i = 0;
	k = 0;
	while (i < 10) {
	    j = i + one;
	    k = k + (i + one);
	    i = i + one;
	}
	return k;
    }
}
