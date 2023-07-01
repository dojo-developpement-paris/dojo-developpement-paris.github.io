package com.dojo.bank;

import java.util.Iterator;
import java.util.List;
import java.util.Spliterator;
import java.util.function.Consumer;

public class Statement implements Iterable<Operation> {
    private final List<Operation> operations;

    public Statement(List<Operation> operations) {
        this.operations = operations;
    }

    public int balance() {
        return operations.stream()
                .mapToInt(Operation::amount)
                .sum();
    }




    @Override
    public Iterator<Operation> iterator() {
        return operations.iterator();
    }

    @Override
    public void forEach(Consumer<? super Operation> action) {
        throw new IllegalAccessError("Not Yet Implemented");
    }



    @Override
    public Spliterator<Operation> spliterator() {
        return operations.spliterator();
    }
}
