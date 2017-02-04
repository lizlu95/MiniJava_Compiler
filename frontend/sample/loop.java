class Const {
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class Test {
    public int do() {
	int i;
	int j;
	i = 0;
	while (i < 10) {
	    j = 0;
	    while (j < 10) {
		j = j + 1;
	    }
	    i = i + 1;
	}
	return i * j;
    }
}
