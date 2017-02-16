class Main {
    public static void main(String[] args) {
        System.out.println(new Foo().doit(new int[10]));
    }
}

class Foo {
    public int doit(int[] arr) {
        int dum;
        dum = this.init(arr);
        return this.sum(arr);
    }

    public int init(int[] arr) {
        int i;
        i = 0;
        while (i < arr.length) {
            arr[i] = i + 1;
            i = i + 1;
        }
        return 0;
    }

    public int sum(int[] arr) {
        int i;
        int sum;
        int len;
        i = 0;
        sum = 0;
        len = arr.length;
        while (i < len) {
            sum = sum + arr[i];
            i = i + 1;
        }
        return sum;
    }
}
