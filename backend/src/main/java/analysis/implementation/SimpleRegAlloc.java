package analysis.implementation;

import ir.frame.Frame;
import ir.temp.Color;
import ir.temp.Temp;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;

import util.IndentingWriter;
import util.List;

import codegen.AssemProc;
import codegen.assem.Instr;

import analysis.FlowGraph;
import analysis.InterferenceGraph;
import analysis.RegAlloc;
import analysis.util.graph.Node;

public class SimpleRegAlloc extends RegAlloc {

    private AssemProc proc;
    private String trace = "";
    private FlowGraph<Instr> fg;
    private InterferenceGraph ig;
    private Frame frame;
    private static final boolean generateDotFiles = false;

    private Map<Temp, Color> colorMap = new HashMap<Temp, Color>();
    private List<Temp> registers;
    private List<Color> colors;
    private List<Color> spillColors = List.empty();
    private int iteration;
    static private int incarnation = 0;

    /**
     * List of *actual* spills.
     */
    private List<Temp> spilled = List.empty();

    @Override
    public void dump(IndentingWriter out) {
        out.println(trace);
        out.println("Coloring {");
        out.indent();
        for (Temp temp : colorMap.keySet()) {
            out.print(temp);
            out.print(" : ");
            out.println(colorMap.get(temp));
            out.indent();
            for (Node<Temp> interferes : ig.nodeFor(temp).succ()) {
                out.print(interferes);
                out.print(":");
                out.print(getColor(interferes));
                out.print(" ");
            }
            out.println();
            out.outdent();
        }
        out.outdent();
        out.println("}");
        out.print("Spilled");
        out.println(spilled);
    }

    public SimpleRegAlloc(AssemProc proc) {
        this(proc, 1);
    }

    public SimpleRegAlloc(AssemProc proc, int iteration) {
        this.proc = proc;
        this.iteration = iteration;
        this.trace += proc.toString();
        this.frame = proc.getFrame();
        this.registers = frame.registers();

        this.colors = List.empty();
        for (Temp reg : registers)
            colors.add(reg.getColor());

        build();
        this.trace += "\n" + "Flow graph:\n" + fg.toString();
        this.trace += ig.toString();

        List<Temp> ordering = simplify();

        build(); // must rebuild the graph, since simplify should destroy it.
        color(ordering);
    }

    private void color(List<Temp> toColor) {
        if (toColor.isEmpty()) return;
        Temp t = toColor.head();
        boolean success;

        // Try to color using a register
        success = tryToColor(t, colors);

        if (!success) {
            // Try to spill using an existing spill slot.
            spilled.add(t);
            success = tryToColor(t, spillColors);
        }

        if (!success) {
            //Create a new spill slot and use that.
            SpillColor color = new SpillColor(frame);
            spillColors.add(color);
            setColor(t, color);
        }
        color(toColor.tail());
    }

    private boolean tryToColor(Temp t, List<Color> colors) {
        for(int i=0;i<ig.moves().size();i++) {
            if (ig.moves().get(i).src.equals(ig.nodeFor(t))
                    && (getColor(ig.moves().get(i).dst)!=null)) {
                if (isColorOK(ig.nodeFor(t), getColor(ig.moves().get(i).dst))) {
                    setColor(t, getColor(ig.moves().get(i).dst));
                    return true;
                }
            }
            else if (ig.moves().get(i).dst.equals(ig.nodeFor(t))
                        && (getColor(ig.moves().get(i).src)!=null)) {
                if (isColorOK(ig.nodeFor(t), getColor(ig.moves().get(i).src))) {
                    setColor(t, getColor(ig.moves().get(i).src));
                    return true;
                }
            }
        }
        for (Color color : colors) {
            if (isColorOK(ig.nodeFor(t), color)) {
                setColor(t, color);
                return true;
            }
        }
        return false;
    }

    private boolean isColorOK(Node<Temp> node, Color color) {
        for (Node<Temp> interferes : node.succ())
            if (color.equals(getColor(interferes))) return false;
        return true;
    }

    /**
     * Start by building the interference graph for the procedure body.
     */
    private void build() {
        this.fg = FlowGraph.build(proc.getBody());
        this.ig = fg.getInterferenceGraph();
        this.ig.name = proc.getLabel().toString() + " round " + iteration;
    }

    // help sorting the toColor list
    private List<Node<Temp>> numbers;
    private List<Node<Temp>> helper;
    private int number;

    public void sort(List<Node<Temp>> values) {
        this.numbers = values;
        number = values.size();
        this.helper = values;
        mergesort(0, number - 1);
    }

    private void mergesort(int low, int high) {
        // check if low is smaller than high, if not then the array is sorted
        if (low < high) {
            // Get the index of the element which is in the middle
            int middle = low + (high - low) / 2;
            // Sort the left side of the array
            mergesort(low, middle);
            // Sort the right side of the array
            mergesort(middle + 1, high);
            // Combine them both
            merge(low, middle, high);
        }
    }

    private void merge(int low, int middle, int high) {

        // Copy both parts into the helper array
        for (int i = low; i <= high; i++) {
            helper.replace(helper.get(i),numbers.get(i));
        }

        int i = low;
        int j = middle + 1;
        int k = low;
        // Copy the smallest values from either the left or the right side back
        // to the original array
        while (i <= middle && j <= high) {
            if (helper.get(i).degree() <= helper.get(j).degree()) {
                numbers.replace(numbers.get(k), helper.get(i));
                i++;
            } else {
                numbers.replace(numbers.get(k), helper.get(j));
                j++;
            }
            k++;
        }
        // Copy the rest of the left side of the array into the target array
        while (i <= middle) {
            numbers.replace(numbers.get(k), helper.get(i));
            k++;
            i++;
        }

    }

    /**
     * Returns a List of Temp's (a stack really) which suggest the order
     * in which nodes should be assigned colors.
     * <p>
     * This version just returns an arbitrary order.
     */
    private List<Temp> simplify() {
        List<Node<Temp>> toColor = List.empty();
        List<Temp> ordering = List.empty();
        int simplified = 0;

        // Separate pre-colored nodes from other nodes.
        for (Node<Temp> node : ig.nodes())
            if (!isColored(node))
                toColor.add(node);

        while (!toColor.isEmpty() && !this.ig.nodes().isEmpty()) {
            sort(toColor);
            Node<Temp> node = toColor.head();
            toColor = toColor.delete(node);
            ordering = List.cons(node.wrappee(), ordering);
            this.ig.rmNode(node);
            if (generateDotFiles) {
                File out = new File("simplify-" + incarnation + "-" + simplified + ".dot");
                try {
                    PrintStream outb = new PrintStream(out);
                    outb.print(ig.dotString(registers.size(), null));
                    outb.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            simplified++;
        }
        incarnation++;
        return ordering;
    }

    private boolean isColored(Node<Temp> node) {
        return getColor(node) != null;
    }

    private Color getColor(Node<Temp> node) {
        return getColor(node.wrappee());
    }

    private void setColor(Temp t, Color color) {
        assert (getColor(t) == null);
        colorMap.put(t, color);
    }

    /**
     * Gets the color of a Temp based on the "hypothetical" coloring we are
     * exploring now.
     */
    private Color getColor(Temp temp) {
        Color color = temp.getColor();
        if (color != null) // it is precolored!
            return color;
        color = colorMap.get(temp);
        return color;
    }

    public List<Temp> getSpilled() {
        return spilled;
    }

    public Map<Temp, Color> getColorMap() {
        return colorMap;
    }

    public String getTrace() {
        return this.toString();
    }
}
