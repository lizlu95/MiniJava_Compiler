class Const {
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class Test {
    public int do() {
	int i;
	int j;
	int k;
	int l;
	i = 0;
	j = 6;
	l = i + j;
	while (i < 10) {
	    i = i + 1;
	    k = i * i;
	}
	return j - l * j + l;
    }
}
