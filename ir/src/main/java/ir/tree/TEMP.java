package ir.tree;

import ir.interp.Word;
import ir.interp.X86_64SimFrame;
import ir.temp.Color;
import ir.temp.Temp;
import ir.visitor.Visitor;
import util.IndentingWriter;
import util.List;


public class TEMP extends IRExp {
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((temp == null) ? 0 : temp.hashCode());
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
        TEMP other = (TEMP) obj;
        if (temp == null) {
            if (other.temp != null)
                return false;
        } else if (!temp.equals(other.temp))
            return false;
        return true;
    }

    public final Temp temp;

    public TEMP(Temp t) {
        assert (t != null);
        temp = t;
    }

    @Override
    public void dump(IndentingWriter out) {
//		out.print("TEMP ");
        out.print(temp);
        if (temp.getColor() != null) {
            out.print(":");
            out.print(temp.getColor());
        }
    }

    @Override
    public IRExp build(List<IRExp> kids) {
        return this;
    }

    @Override
    public List<IRExp> kids() {
        return List.empty();
    }

    @Override
    public Word interp(X86_64SimFrame env) {
        //We only get here if we are reading the TEMP.
        //A TMP in the dst of a MOVE is treated explicitly by MOVE
        return env.getTemp(temp);
    }

    public Color getColor() {
        return temp.getColor();
    }

    @Override
    public void set(Word value, X86_64SimFrame env) {
        env.setTemp(temp, value);
    }

    @Override
    public boolean mentions(Temp t) {
        return temp.equals(t);
    }

    @Override
    public List<Temp> use() {
        return List.list(temp);
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}

