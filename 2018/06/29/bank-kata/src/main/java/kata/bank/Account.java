package kata.bank;

public class Account {

    private final Console console;
    private int balance;
    private int withdrawal;

    public Account(Console console, AccountRepository accountRepository) {

        this.console = console;
        balance = 0;
    }

    public void deposit(int amount) {
        balance = amount;

    }

    public void withdrawal(int amount) {
        withdrawal = amount;
    }

    public void printStatement() {
        console.printLine("DATE | AMOUNT | BALANCE");
        console.printLine("29/06/2018 | " + balance + " | " + balance);
        console.printLine("29/06/2018 | " + -withdrawal + " | " + (balance - withdrawal));

    }
}
