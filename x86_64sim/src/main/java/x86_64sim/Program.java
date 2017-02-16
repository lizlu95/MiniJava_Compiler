package x86_64sim;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import x86_64sim.instruction.Instruction;

public class Program {
    List<Instruction> instructions;
    Map<String, Long> labels;
    Map<Long, Long> staticData = new HashMap<Long, Long>();
    Map<Long, String> relocationData = new HashMap<Long, String>();
    boolean inText = true;
    long pc;
    long dc = State.HEAP_BASE;

    public Program() {
        instructions = new ArrayList<Instruction>();
        labels = new HashMap<String, Long>();
        pc = 0;
    }

    public long getLabel(String label) {
        return labels.get(label);
    }

    public void doData() {
        inText = false;
    }

    public void doText() {
        inText = true;
    }

    public void doAlign(String value) {
        assert (value.equals("4"));
    }

    Pattern numberPattern = Pattern.compile("-?[0-9]+");
    Matcher numberMatcher = numberPattern.matcher("");

    public void doQuad(String value) {
        numberMatcher.reset(value);
        if (numberMatcher.matches())
            staticData.put(dc, Long.parseLong(value));
        else if (labels.containsKey(value))
            staticData.put(dc, labels.get(value));
        else
            relocationData.put(dc, value);
        dc += 8;
    }

    public void add(String label) {
        if (inText)
            labels.put(label, pc);
        else
            labels.put(label, dc);
    }

    public void add(Instruction i) {
        instructions.add(i);
        pc++;
    }

    private String labelAt(int pc) {
        for (String label : labels.keySet()) {
            Long addr = labels.get(label);
            if (addr == pc)
                return label;
        }
        return null;
    }

    Pattern boringLabel = Pattern.compile(".*_[0-9]+$");
    Matcher m = boringLabel.matcher("");

    public String getFunctionAt(long pc) {
        String closestLabel = null;
        long closestAddr = -1;
        if (pc == 99999999999999L)
            return "__start";
        for (String label : labels.keySet()) {
            m.reset(label);
            if (m.matches()) continue;
            Long addr = labels.get(label);
            if (addr <= pc && addr > closestAddr) {
                closestAddr = addr;
                closestLabel = label;
            }
        }
        return closestLabel == null ? "unknown" : closestLabel;
    }

    public String dump() {
        StringBuilder sb = new StringBuilder();
        sb.append("Program with " + labels.size() + " labels and " + instructions.size() + " instructions\n");
        for (int pc = 0; pc < instructions.size(); ++pc) {
            String l = labelAt(pc);
            if (l != null) sb.append(l).append(":").append("\n");
            sb.append(instructions.get(pc)).append("\n");
        }
        return sb.toString();
    }

    public String toString() {
        return dump();
    }

    public long findMain() {
        long answer = -1;
        for (String label : labels.keySet()) {
            if (label.endsWith("main")) {
                if (answer == -1) {
                    answer = labels.get(label);
                } else {
                    throw new RuntimeException("Duplicate main method???");
                }
            }
        }
        return answer == -1 ? 0 : answer;
    }

    public int countInstructions() {
        return instructions.size();
    }

    public long writeStatic(Memory ram) {
        for (Long addr : staticData.keySet()) {
            Long value = staticData.get(addr);
            ram.write(addr, value);
        }
        for (Long addr : relocationData.keySet()) {
            String value = relocationData.get(addr);
            ram.write(addr, labels.get(value));
        }
        return dc;
    }
}
