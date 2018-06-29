package kata.bank;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.verify;

public class BankFeatureTest {

    private Console console;
    private Account account;

    @BeforeEach
    void setUp() {
        console = Mockito.mock(Console.class);
        AccountRepository accountRepository = new AccountRepository();
        account = new Account(console, accountRepository);

    }

    @Test
    void spec1() {
        account.deposit(1000);
        account.withdrawal(500);
        account.deposit(1000);

        account.printStatement();

        verify(console).printLine("DATE | AMOUNT | BALANCE");
        verify(console).printLine("29/06/2018 | 1000 | 1000");
        verify(console).printLine("29/06/2018 | -500 | 500");
        verify(console).printLine("29/06/2018 | 1000 | 1500");

    }

    @Test
    void spec2() {
        account.deposit(2000);
        account.withdrawal(500);

        account.printStatement();

        verify(console).printLine("DATE | AMOUNT | BALANCE");
        verify(console).printLine("29/06/2018 | 2000 | 2000");
        verify(console).printLine("29/06/2018 | -500 | 1500");

    }
}
