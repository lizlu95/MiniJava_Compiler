package analysis.implementation;

import analysis.FlowGraph;
import analysis.Liveness;
import analysis.util.ActiveSet;
import analysis.util.graph.Node;
import ir.temp.Temp;
import util.List;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


public class LivenessImplementation<N> extends Liveness<N> {

    public LivenessImplementation(FlowGraph<N> graph) {
        super(graph);
    }

    public Map<Node<N>,List<Temp>> out = new ConcurrentHashMap<>();
    public Map<Node<N>,List<Temp>> in = new ConcurrentHashMap<>();

    @Override
    public List<Temp> liveOut(Node<N> node) {
        if (out.get(node)!=null) return out.get(node);
        List<Node<N>> s = node.succ();
        ActiveSet<Temp> set = new ActiveSet<>();
        List<Temp> tmp;
        switch (s.size()){
            case 0:
                return List.empty();
            case 1:
                if(in.get(s.get(0)) != null)
                    tmp = in.get(s.get(0));
                else tmp = liveIn(s.get(0));
                ActiveSet<Temp> t = new ActiveSet<>();
                t.addAll(tmp);
                set = ActiveSet.union(set,t);
                return set.getElements();
            case 2:
                ActiveSet<Temp> t2 = new ActiveSet<>();
                /*if(in.get(s.get(0)) != null)
                    tmp = in.get(s.get(0));
                else tmp = liveIn(s.get(0));
                t2.addAll(tmp);*/
                if(in.get(s.get(1)) != null)
                    tmp = in.get(s.get(1));
                else tmp = liveIn(s.get(1));
                t2.addAll(tmp);
                set = ActiveSet.union(set,t2);
                return set.getElements();
            case 3:
                ActiveSet<Temp> t3 = new ActiveSet<>();
                /*if(in.get(s.get(0)) != null)
                    tmp = in.get(s.get(0));
                else tmp = liveIn(s.get(0));
                t2.addAll(tmp);*/
                if(in.get(s.get(1)) != null)
                    tmp = in.get(s.get(1));
                else tmp = liveIn(s.get(1));
                t3.addAll(tmp);
                if(in.get(s.get(2)) != null)
                    tmp = in.get(s.get(2));
                else tmp = liveIn(s.get(2));
                t3.addAll(tmp);
                set = ActiveSet.union(set,t3);
                return set.getElements();
            default:
                return List.empty();
        }
        /*for (int i = 0; i < s.size(); i++) {

            if(in.get(s.get(i)) != null) tmp = in.get(s.get(i));
            else {
                return List.empty();
                *//*tmp = liveIn(s.get(i));
                in.put(s.get(i),tmp);*//*
            }*/

        //}
        //return set.getElements();

    }

    private List<Temp> liveIn(Node<N> node) {
        if (in.get(node)!=null) return in.get(node);
        ActiveSet<Temp> set = new ActiveSet<>();
        List<Temp> o;
        if (out.get(node) != null) o = out.get(node);
        else {
            o = liveOut(node);
            out.put(node,o);
        }
        set.addAll(o);
        ActiveSet<Temp>tmp = set.remove(this.g.def(node));
        List<Temp> u = this.g.use(node);
        ActiveSet<Temp> us = new ActiveSet<>();
        us.addAll(u);
        ActiveSet<Temp> r = ActiveSet.union(us,tmp);
        in.replace(node, r.getElements());
        return r.getElements();
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

}
