package ir.tree;

import ir.visitor.Visitor;

/**
 * Supertype for all IR nodes (i.e. either IRStm or IRExp).
 */
public interface IRNode {
    public String onOneLine();

    public abstract <R> R accept(Visitor<R> v);
}