package cashregister;

import junitparams.JUnitParamsRunner;
import junitparams.Parameters;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(JUnitParamsRunner.class)
public class PriceQueryTest {

    private PriceQuery priceQuery = new PriceQuery(
            new Reference("BANANA", Price.valueOf(3.0)),
            new Reference("APPLE", Price.valueOf(2.0))
    );

    @Parameters({"APPLE, 2.0",
                "BANANA, 3.0"})
    @Test
    public void find_a_price_given_a_code(String code, double priceValue) throws Exception {

        Result r = priceQuery.findPrice(code);

        assertThat(r).isEqualTo(Result.found(Price.valueOf(priceValue)));

    }

    @Test
    public void price_query_on_unknown_code() throws Exception {

        Result r = priceQuery.findPrice("POIRE");

        assertThat(r).isEqualTo(Result.notFound("POIRE"));

    }
}
