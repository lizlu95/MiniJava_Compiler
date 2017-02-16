class Const {
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class Test {
    public boolean odd(int x) {
	while (1 < x) {
	    x = x - 2;
	}
	return x < 1;
    }
    public int do() {
	int i;
	int j;
	i = 0;
	while (i < 10) {
	    j = 0;
	    while (j < 10) {
		if (this.odd(j)) {
		    j = j + 1;
		} else {
		    j = j + 3;
		}
	    }
	    i = i + 1;
	}
	return i * j;
    }
}
