package com.dojo.bank;

import java.util.ArrayList;
import java.util.List;

public class Account {
    private int balance;
    private List<Operation> operations = new ArrayList<>();

    public int balance() {
        return balance;
    }

    public void deposit(int amount) {
        this.operations.add(Operation.deposit(amount));
        this.balance += amount;
    }

    public void withdrawal(int amount) {
        this.operations.add(Operation.withdrawal(amount));
        this.balance -= amount;
    }

    public Statement statement() {
        return new Statement(this.operations);
    }
}
