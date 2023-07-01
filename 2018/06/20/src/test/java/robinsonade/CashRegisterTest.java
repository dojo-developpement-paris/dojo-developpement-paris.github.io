package robinsonade;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class CashRegisterTest {

    @Test
    void calculate_total() {

        ProductReferenceRepository productReferenceRepository = new ProductReferenceRepository();
        CashRegister cashRegister = new CashRegister();

        var productReference = new ProductReference("BANANE", new Price(5.0));
        productReferenceRepository.add(productReference);

        assertThat(cashRegister.total(productReferenceRepository.getByReference("BANANE"),
                new Quantity(2)))
                .isEqualTo(Result.found(new Price(10.0)));
    }
}
