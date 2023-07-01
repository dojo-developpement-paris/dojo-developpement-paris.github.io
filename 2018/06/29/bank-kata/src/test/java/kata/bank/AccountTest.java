package kata.bank;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.verify;

public class AccountTest {

    @Test
    void test_print_statement() {
        Console console = Mockito.mock(Console.class);
        AccountRepository accountRepository = new AccountRepository();
        Account account = new Account(console, accountRepository);
        account.deposit(1000);
        account.withdrawal(500);
        account.printStatement();

        verify(console).printLine("DATE | AMOUNT | BALANCE");
        verify(console).printLine("29/06/2018 | 1000 | 1000");
        verify(console).printLine("29/06/2018 | -500 | 500");
    }

    @Test
    void test_print_statement_2() {
        Console console = Mockito.mock(Console.class);
        AccountRepository accountRepository = new AccountRepository();
        Account account = new Account(console, accountRepository);
        account.deposit(2000);
        account.withdrawal(500);

        account.printStatement();

        verify(console).printLine("DATE | AMOUNT | BALANCE");
        verify(console).printLine("29/06/2018 | 2000 | 2000");
        verify(console).printLine("29/06/2018 | -500 | 1500");
    }

    @Test
    void test_deposit() {
        Console console = Mockito.mock(Console.class);
        AccountRepository accountRepository = new AccountRepository();
        Account account = new Account(console, accountRepository);
        account.deposit(2000);

        assertThat(accountRepository.getOperations())
                .contains(new Operation(OperationType.DEPOSIT, 2000));



    }
}
