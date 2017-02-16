package ir.temp;

import java.util.ArrayList;
import java.util.List;

public class CompositeTemp extends Temp {
    private List<Temp> elements = new ArrayList<Temp>();

    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        boolean first = true;
        sb.append("[");
        for (Temp t : elements) {
            if (first) {
                first = false;
            } else {
                sb.append(", ");
            }
            sb.append(t.toString());
        }
        sb.append("]");
        return sb.toString();
    }

    public CompositeTemp(Temp t1, Temp t2) {
        if (t1 instanceof CompositeTemp) {
            for (Temp tt : ((CompositeTemp) t1).elements) {
                elements.add(tt);
            }
        } else {
            elements.add(t1);
        }
        if (t2 instanceof CompositeTemp) {
            for (Temp tt : ((CompositeTemp) t2).elements) {
                elements.add(tt);
            }
        } else {
            elements.add(t2);
        }
        spreadColor();
    }

    @Override
    public Color getColor() {
        for (Temp t : elements) {
            if (t.getColor() != null) {
                color = t.getColor();
            }
        }
        return color;
    }

    private void spreadColor() {
        for (Temp t : elements) {
            if (t.getColor() != null) {
                color = t.getColor();
            }
        }
        for (Temp t : elements) {
            if (t.getColor() == null) {
                t.paint(color);
            }
        }
    }

    @Override
    public void uncolor() {
        for (Temp t : elements) {
            t.uncolor();
        }
        color = null;
    }

    /**
     * A Temp can be painted in some color (this is used by the register allocator) to
     * paint each Temp according to the register it is allocated to.
     */
    @Override
    public void paint(Color color) {
        assert (this.color == null) :
                "Not allowed to paint a Temp more than once! (Uncolor it first)";
        this.color = color;
        for (Temp t : elements) {
            if (t.getColor() != null) {
                assert (t.getColor().equals(color));
                // Do nothing, we have merged a painted temp with a non-painted temp
            } else {
                t.paint(color);
            }
        }
    }

    @Override
    public String getName() {
        return toString();
    }

    @Override
    public List<Temp> elements() {
        return elements;
    }
}

