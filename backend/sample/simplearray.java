class Array{
    public static void main(String[] a){
	System.out.println(new Test().do());
    }
}

class Test {
    int [] a;
    public int fill() {
	int i;
	a = new int[10];
	i = 0;
	while (i < 10) {
	    a[i] = i * i;
	    i = i + 1;
	}
	return 0;
    }
    public int print(){
	int i;
	i = 0;
	while (i < 10) {
	    System.out.println(a[i]);
	    i = i + 1;
	}
	return 0;
    }
    public int do() {
	int i;
	i = this.fill();
	i = this.print();
	return 0;
    }
}
