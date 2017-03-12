package ast;

import util.ImpTable;
import visitor.Visitor;

/**
 * Created by HollySun on 2017-03-08.
 */
public class ClassType extends Type {
    public String superName;
    public ImpTable<Type> fields = new ImpTable<Type>();
    public ImpTable<Type> methds = new ImpTable<Type>();


    @Override
    public boolean equals(Object other) {
        return this.getClass() == other.getClass();
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}
