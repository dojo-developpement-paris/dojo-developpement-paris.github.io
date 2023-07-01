package com.dojo.bank;

public class Withdrawal extends Operation {
    public Withdrawal(int amount) {
        super(amount);
    }

    @Override
    public int amount() {
        return -this.amount;
    }
}
