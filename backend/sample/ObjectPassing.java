class ArrayPassing {
    public static void main(String[] args) {
        System.out.println(new Foo().doit());
    }
}

class Foo {
    int field;

    public int doit() {
        field = 10;
        return this.ident(this).getField();
    }

    public Foo ident(Foo f) {
        return f;
    }

    public int getField() {
        return field;
    }
}
