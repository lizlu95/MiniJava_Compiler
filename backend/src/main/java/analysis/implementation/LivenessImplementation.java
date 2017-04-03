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
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


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
//        for (int i=0;i<one.size();i++){
//            if (one.get(i).equals(two.get(i))){
//                //continue;
//            }
//            else{
//                return false;
//            }
//        }
//        return true;
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

    public List<Node<N>> getListOfSuccessor(Node<N> node){
        List<Node<N>> allNodes = g.nodes();
        List<Node<N>> succ = List.empty();
        for (Node<N> n : allNodes){
            if (node.goesTo(n)){
                succ.add(n);
            }
        }
        return succ;
    }

    //Liz
    //public Map<Node<N>,List<Temp>> out = new ConcurrentHashMap<>();
    //public Map<Node<N>,List<Temp>> in = new ConcurrentHashMap<>();

    @Override
    public List<Temp> liveOut(Node<N> node) {
        // Liz Try #2
//        if (out.get(node)!=null) return out.get(node);
//        List<Node<N>> s = node.succ();
//        ActiveSet<Temp> set = new ActiveSet<>();
//        List<Temp> tmp;
//        switch (s.size()){
//            case 0:
//                return List.empty();
//            case 1:
//                if(in.get(s.get(0)) != null)
//                    tmp = in.get(s.get(0));
//                else tmp = liveIn(s.get(0));
//                ActiveSet<Temp> t = new ActiveSet<>();
//                t.addAll(tmp);
//                set = ActiveSet.union(set,t);
//                return set.getElements();
//            case 2:
//                ActiveSet<Temp> t2 = new ActiveSet<>();
//                /*if(in.get(s.get(0)) != null)
//                    tmp = in.get(s.get(0));
//                else tmp = liveIn(s.get(0));
//                t2.addAll(tmp);*/
//                if(in.get(s.get(1)) != null)
//                    tmp = in.get(s.get(1));
//                else tmp = liveIn(s.get(1));
//                t2.addAll(tmp);
//                set = ActiveSet.union(set,t2);
//                return set.getElements();
//            case 3:
//                ActiveSet<Temp> t3 = new ActiveSet<>();
//                /*if(in.get(s.get(0)) != null)
//                    tmp = in.get(s.get(0));
//                else tmp = liveIn(s.get(0));
//                t2.addAll(tmp);*/
//                if(in.get(s.get(1)) != null)
//                    tmp = in.get(s.get(1));
//                else tmp = liveIn(s.get(1));
//                t3.addAll(tmp);
//                if(in.get(s.get(2)) != null)
//                    tmp = in.get(s.get(2));
//                else tmp = liveIn(s.get(2));
//                t3.addAll(tmp);
//                set = ActiveSet.union(set,t3);
//                return set.getElements();
//            default:
//                return List.empty();
//        }
//        /*for (int i = 0; i < s.size(); i++) {
//
//            if(in.get(s.get(i)) != null) tmp = in.get(s.get(i));
//            else {
//                return List.empty();
//                *//*tmp = liveIn(s.get(i));
//                in.put(s.get(i),tmp);*//*
//            }*/
//
//        //}
//        //return set.getElements();

        //
//        //Liz
//        List<Node<N>> s = node.succ();
///*        ActiveSet<Node<N>> ins = new ActiveSet<>();
//        ins.addAll(s);*/
//        ActiveSet<Temp> set = new ActiveSet<>();
///*        ins.addListener(new ActiveSet.ASListener<Node<N>>() {
//            @Override
//            public void elementAdded(Node<N> nNode) {
//                ActiveSet<Temp> t = new ActiveSet<>();
//                List<Temp> in = liveIn(nNode);
//                t.addAll(in);
//                set.add(t);
//            }
//        });
//        ActiveSet<Temp> res = ActiveSet.union(set.getElements());*/
//
//        if (node.outDegree() == 0)
//            return List.empty();
//        else if (node.outDegree() == 1){
//            List<Temp> tmp = liveIn(s.get(0));
//            ActiveSet<Temp> t = new ActiveSet<>();
//            t.addAll(tmp);
//            set = ActiveSet.union(set,t);
//            return set.getElements();
//        }
//        else {
//            List<Temp> tmp = liveIn(s.get(1));
//            ActiveSet<Temp> t = new ActiveSet<>();
//            t.addAll(tmp);
////            tmp = liveIn(s.get(1));
////            t.addAll(tmp);
//            set = ActiveSet.union(set,t);
//            return set.getElements();
//        }

        //Robin
//        return outMap.get(node);
        List<Temp> savedList = outMap.get(node);
        if (savedList != null){
            return savedList;
        }
        List<Node<N>> s = getListOfSuccessor(node);
        //stop the repetitions
        ActiveSet<Node<N>> sActive = new ActiveSet<>();
        sActive.addAll(s);
        s = sActive.getElements(); //make sure no repetitions

        ActiveSet<Temp> set = new ActiveSet<Temp>();
        List<ActiveSet<Temp>> list = List.empty();
        for (Node<N> ss : s) {
            if (ss.equals(node)){
                break;
            }
            List<Temp> tmp = inMap.get(ss);
            if (tmp == null) {
                tmp = liveIn(ss);
            }
            ActiveSet<Temp> t = new ActiveSet<Temp>();
            t.addAll(tmp);
            list.add(t);
//            set = ActiveSet.union(set,t);
        }
        set = ActiveSet.union(list);
        outMap.put(node,set.getElements());
        return set.getElements();
    }

    private List<Temp> liveIn(Node<N> node) {
        //Liz try #2
//        if (in.get(node)!=null) return in.get(node);
//        ActiveSet<Temp> set = new ActiveSet<>();
//        List<Temp> o;
//        if (out.get(node) != null) o = out.get(node);
//        else {
//            o = liveOut(node);
//            out.put(node,o);
//        }
//        set.addAll(o);
//        ActiveSet<Temp>tmp = set.remove(this.g.def(node));
//        List<Temp> u = this.g.use(node);
//        ActiveSet<Temp> us = new ActiveSet<>();
//        us.addAll(u);
//        ActiveSet<Temp> r = ActiveSet.union(us,tmp);
//        in.replace(node, r.getElements());
//        return r.getElements();

        //       return inMap.get(node);
        List<Temp> savedList = inMap.get(node);
        if (savedList != null){
            return savedList;
        }
        ActiveSet<Temp> set = new ActiveSet<Temp>();
        List<Temp> o = outMap.get(node);
        if (o == null){
            o = liveOut(node);
//            o = List.empty(); <-- should not do this
        }
        set.addAll(o);
        ActiveSet<Temp>tmp = set.remove(this.g.def(node));
        List<Temp> u = this.g.use(node);

        ActiveSet<Temp> us = new ActiveSet<Temp>();
        us.addAll(u);
        ActiveSet<Temp> r = ActiveSet.union(us,tmp);

        inMap.put(node,r.getElements());
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
