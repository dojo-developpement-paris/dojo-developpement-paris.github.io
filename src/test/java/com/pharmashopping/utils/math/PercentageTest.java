package com.pharmashopping.utils.math;

import org.assertj.core.api.Assertions;
import org.junit.Test;

import java.math.BigDecimal;

public class PercentageTest {


    public static final BigDecimal TWENTY = new BigDecimal("20.00");
    public static final BigDecimal TWO_HUNDRED = new BigDecimal(200);

    @Test
    public void should_apply_percentage_on_value_to_retrieve_corresponding_partial_part(){
        Percentage percentage = new Percentage(10);
        Assertions.assertThat(percentage.applyToRetrievePartialValueOf(TWO_HUNDRED)).isEqualTo(TWENTY);
    }

}