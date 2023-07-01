package com.dojo.bank;

import java.util.Objects;

public class Operation {
    protected final int amount;

    protected Operation(int amount) {
        this.amount = amount;
    }

    public static Operation deposit(int amount) {
        return new Deposit(amount);
    }

    public static Operation withdrawal(int amount) {
        return new Withdrawal(amount);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Operation)) return false;
        Operation operation = (Operation) o;
        return amount == operation.amount;
    }

    @Override
    public int hashCode() {
        return Objects.hash(amount);
    }

    @Override
    public String toString() {
        return "Operation{" +
                "amount=" + amount +
                '}';
    }

    public int amount() {
        return amount;
    }
}
