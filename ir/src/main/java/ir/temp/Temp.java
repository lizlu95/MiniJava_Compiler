package ir.temp;

import java.util.ArrayList;
import java.util.List;


public class Temp implements Comparable<Temp> {
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Temp other = (Temp) obj;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }

    private static int count;

    protected Color color = null;

    private String name;

    private static String ndigit(int n, int digits) {
        String s = Integer.toString(n);
        while (s.length() < digits) {
            s = "0" + s;
        }
        return s;
    }

    public String toString() {
        return name;
    }

    public Temp() {
        name = "t" + ndigit(count++, 3);
    }

    /**
     * Create a new Temp, which is pre-colored. This means the Temp
     * represents an actual register. A new and unique color object is
     * created to represent this register so that other temps can be
     * colored with it.
     */
    public Temp(String registerName) {
        this.name = registerName;
        if (registerName.startsWith("%")) {
            this.color = new Color() {
                @Override
                public String toString() {
                    return name;
                }

                @Override
                public boolean isRegister() {
                    return true;
                }
            };
        }
    }

    public Color getColor() {
        return color;
    }

    public void uncolor() {
        color = null;
    }

    /**
     * A Temp can be painted in some color (this is used by the register allocator) to
     * paint each Temp according to the register it is allocated to.
     */
    public void paint(Color color) {
        assert(this.color == null) : "Not allowed to paint a Temp more than once! (Uncolor it first)";
        this.color = color;
    }

    public String getName() {
        return name;
    }

    public List<Temp> elements() {
        List<Temp> r = new ArrayList<Temp>();
        r.add(this);
        return r;
    }

    @Override
    public int compareTo(Temp arg0) {
        return getName().compareTo(arg0.getName());
    }
}

