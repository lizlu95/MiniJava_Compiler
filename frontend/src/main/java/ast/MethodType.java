package ast;

import util.ImpTable;
import visitor.Visitor;

/**
 * Created by HollySun on 2017-03-08.
 */
public class MethodType extends Type {
    public ImpTable<Type> params = new ImpTable<Type>();
    public ImpTable<Type> locals = new ImpTable<Type>();
    public Type returnType;

    @Override
    public boolean equals(Object other) {
        return this.getClass() == other.getClass();
    }

    @Override
    public <R> R accept(Visitor<R> v) {
        return v.visit(this);
    }
}
