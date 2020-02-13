package com.dojo.bank;

import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class ToBeNamed {

    @Test
    public void accountInitialBalanceIs0() {
        var account = new Account();
        assertThat(account.balance())
                .isEqualTo(0);
    }

    @Test
    public void afterADepositBalanceIsIncreased() {
        var account = new Account();
        account.deposit(10);
        assertThat(account.balance())
                .isEqualTo(10);

        account.deposit(8);
        assertThat(account.balance())
                .isEqualTo(18);
    }

    @Test
    public void afterWithdrawalBalanceIsDecreased() {
        var account = new Account();
        account.deposit(20);
        account.withdrawal(7);

        assertThat(account.balance())
                .isEqualTo(13);

        account.withdrawal(5);
        assertThat(account.balance())
                .isEqualTo(8);
    }

    @Test
    public void initialStatementIsEmpty() {
        var account = new Account();
        assertThat(account.statement()).isEmpty();
    }

    @Test
    public void afterOneDepositStatementContainsOneDeposit() {
        var account = new Account();
        account.deposit(17);
        assertThat(account.statement()).containsOnly(Operation.deposit(17));
    }

    @Test
    public void afterOneWithdrawalStatementContainsOneWithdrawal() {
        var account = new Account();
        account.withdrawal(15);
        assertThat(account.statement()).containsOnly(Operation.withdrawal(15));
    }

    @Test
    public void statementBalanceIsEqualToAccountBalance() {
        var account = new Account();
        account.deposit(17);
        account.withdrawal(12);

        assertThat(account.statement().balance())
                .isEqualTo(account.balance());
    }


}
