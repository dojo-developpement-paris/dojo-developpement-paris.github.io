package cashregister;

import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class CashRegisterTest {

    private PriceQuery priceQuery = new PriceQuery(
            new Reference("BANANA", Price.valueOf(3.0)),
            new Reference("APPLE", Price.valueOf(2.0))
    );

    @Test
    public void compute_total() throws Exception {

        Result r = priceQuery.findPrice("BANANA");
        Quantity quantity = Quantity.valueOf(2.0);

        Result total = CashRegister.total(r, quantity);

        assertThat(total).isEqualTo(Result.found(Price.valueOf(6.0)));
    }

    @Test
    public void compute_total_code_unknown() throws Exception {

        Result r = priceQuery.findPrice("POIRE");
        Quantity quantity = Quantity.valueOf(2.0);

        Result total = CashRegister.total(r, quantity);

        assertThat(total).isEqualTo(Result.notFound("POIRE"));
    }
}
