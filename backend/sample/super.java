class SuperTest {
    public static void main(String[] a) {
        System.out.println(new Test(). do ());
    }
}

class A {
    int x;
    int y;

    public int ainit(int px, int py) {
        x = px;
        y = py;
        return 0;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public int sum() {
        return x + y;
    }
}

class B extends A {
    int z;

    public int binit(int px, int py, int pz) {
        int junk;
        junk = this.ainit(px, py);
        z = pz;
        return 0;
    }

    public int getZ() {
        return z;
    }

    public int sum() {
        return x + y + z;
    }
}

class Test {
    public int do()

    {
        A a;
        B b;
        A aa;
        int junk;
        a = new A();
        b = new B();
        aa = b;
        junk = a.ainit(1, 2);
        junk = b.binit(1, 2, 3);
        System.out.println(a.getX());
        System.out.println(a.getY());
        System.out.println(b.getZ());
        System.out.println(a.sum());
        System.out.println(b.sum());
        System.out.println(aa.sum());
        return 0;
    }
}
