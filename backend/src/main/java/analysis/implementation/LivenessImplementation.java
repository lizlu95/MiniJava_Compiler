package analysis.implementation;

import analysis.FlowGraph;
import analysis.Liveness;
import analysis.util.ActiveSet;
import analysis.util.graph.Node;
import ir.temp.Temp;
import util.List;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;


public class LivenessImplementation<N> extends Liveness<N> {

    public HashMap<Node<N>,List<Temp>> inMap;
    public HashMap<Node<N>,List<Temp>> outMap;
    public HashMap<Node<N>,List<Temp>> inMapPrime;
    public HashMap<Node<N>,List<Temp>> outMapPrime;

    public LivenessImplementation(FlowGraph<N> graph) {
        super(graph);
        inMap = new HashMap<>();
        outMap = new HashMap<>();
        inMapPrime = new HashMap<>();
        outMapPrime = new HashMap<>();
        iterativeLiveness();
    }

    public void iterativeLiveness(){
        List<Node<N>> nodes = g.nodes();
        for (Node<N> n : nodes){
            inMap.put(n,List.empty());
            outMap.put(n,List.empty());
        }
        do{
            for (Node<N> n: nodes){
                inMapPrime.put(n,inMap.get(n));
                outMapPrime.put(n,outMap.get(n));

                ActiveSet<Temp> inListActive = new ActiveSet<>();
                inListActive.addAll(outMap.get(n));
                inListActive = inListActive.remove(this.g.def(n));
                inListActive.addAll(this.g.use(n));
                inMap.put(n,inListActive.getElements());

                ActiveSet<Temp> outListActive = new ActiveSet<>();
                for (Node<N> s : n.succ()){
                    outListActive.addAll(inMap.get(s));
                }
                outMap.put(n,outListActive.getElements());
            }
        }while (! isEnd());
    }

    private boolean isEqualList(List<Temp> one, List<Temp> two){
        if (one.size() != two.size()){
            return false;
        }
        ActiveSet<Temp> oneActive = new ActiveSet<>();
        oneActive.addAll(one);
        oneActive = oneActive.remove(two);

        int size = oneActive.getElements().size();
        if (size == 0){
            return true;
        }
        return false;
    }

    public boolean isEnd(){
        for (Node<N> n : g.nodes()){
            boolean isInEqual = isEqualList(inMap.get(n),inMapPrime.get(n));
            boolean isOutEqual = isEqualList(outMap.get(n),outMapPrime.get(n));
            if(isInEqual && isOutEqual){

            }
            else{
                return false;
            }
        }
        return true;
    }

    @Override
    public List<Temp> liveOut(Node<N> node) {
        return outMap.get(node);
    }

    private List<Temp> liveIn(Node<N> node) {
        return inMap.get(node);
    }

    private String shortList(List<Temp> l) {
        java.util.List<String> reall = new java.util.ArrayList<String>();
        for (Temp t : l) {
            reall.add(t.toString());
        }
        Collections.sort(reall);
        StringBuffer sb = new StringBuffer();
        sb.append(reall);
        return sb.toString();
    }

    private String dotLabel(Node<N> n) {
        StringBuffer sb = new StringBuffer();
        sb.append(shortList(liveIn(n)));
        sb.append("\\n");
        sb.append(n);
        sb.append(": ");
        sb.append(n.wrappee());
        sb.append("\\n");
        sb.append(shortList(liveOut(n)));
        return sb.toString();
    }

    private double fontSize() {
        return (Math.max(30, Math.sqrt(Math.sqrt(g.nodes().size() + 1)) * g.nodes().size() * 1.2));
    }

    private double lineWidth() {
        return (Math.max(3.0, Math.sqrt(g.nodes().size() + 1) * 1.4));
    }

    private double arrowSize() {
        return Math.max(2.0, Math.sqrt(Math.sqrt(g.nodes().size() + 1)));
    }

    @Override
    public String dotString(String name) {
        StringBuffer out = new StringBuffer();
        out.append("digraph \"Flow graph\" {\n");
        out.append("labelloc=\"t\";\n");
        out.append("fontsize=" + fontSize() + ";\n");
        out.append("label=\"" + name + "\";\n");

        out.append("  graph [size=\"6.5, 9\", ratio=fill];\n");
        for (Node<N> n : g.nodes()) {
            out.append("  \"" + dotLabel(n) + "\" [fontsize=" + fontSize());
            out.append(", style=\"setlinewidth(" + lineWidth() + ")\", color=" + (g.isMove(n) ? "green" : "blue"));
            out.append("]\n");
        }
        for (Node<N> n : g.nodes()) {
            for (Node<N> o : n.succ()) {
                out.append("  \"" + dotLabel(n) + "\" -> \"" + dotLabel(o) + "\" [arrowhead = normal, arrowsize=" + arrowSize() + ", style=\"setlinewidth(" + lineWidth() + ")\"];\n");
            }
        }

        out.append("}\n");
        return out.toString();
    }

    public void displayMap(HashMap m, StringBuffer out){
        // Display elements
        // Get a set of the entries
        Set set = m.entrySet();

        // Get an iterator
        Iterator i = set.iterator();

        out.append("HashMap: \n");
        while(i.hasNext()) {
            HashMap.Entry me = (HashMap.Entry)i.next();
            out.append(me.getKey() + ": ");
            List<Temp> n  = (List)me.getValue();
            for(Temp nn : n){
                out.append(nn+" ");
            }
            out.append("\n");
//            out.append(me.getValue());
        }
        out.append("\n");
    }

}
