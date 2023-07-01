package fr.noether.primefactor;

import org.junit.Before;
import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class PrimeFactorImplem2Test {

    private PrimeFactor primeFactor;

    @Before
    public void setUp() {
        this.primeFactor = new PrimeFactorImplem2();
    }

    @Test
    public void prime_factor_of_0_should_be_nothing() {
        var factorList = primeFactor.primeFactors(0);
        assertThat(factorList).isEmpty();
    }

    @Test
    public void prime_factor_of_1_should_be_nothing() {
        var factorList = primeFactor.primeFactors(1);
        assertThat(factorList).isEmpty();
    }

    @Test
    public void prime_factor_of_2_should_be_2() {
        var factorList = primeFactor.primeFactors(2);
        assertThat(factorList)
                .isNotEmpty()
                .hasSize(1);

        assertThat(factorList).contains(2);
    }

    @Test
    public void prime_factor_of_3_should_be_3() {
        var factorList = primeFactor.primeFactors(3);
        assertThat(factorList)
                .isNotEmpty()
                .hasSize(1);

        assertThat(factorList).containsExactlyInAnyOrder(3);
    }

    @Test
    public void three_is_a_prime_number() {
        var threeIsAPrimeNumber = primeFactor.isAPrimeNumber(3);
        assertThat(threeIsAPrimeNumber).isTrue();
    }

    @Test
    public void twenty_five_is_not_a_prime_number() {
        var twentyFiveIsNotAPrimeNumber = primeFactor.isAPrimeNumber(25);
        assertThat(twentyFiveIsNotAPrimeNumber).isFalse();
    }

    @Test
    public void twenty_six_is_not_a_prime_number() {
        var twentySixIsNotAPrimeNumber = primeFactor.isAPrimeNumber(26);
        assertThat(twentySixIsNotAPrimeNumber).isFalse();
    }

    @Test
    public void prime_factors_of_twenty_should_be_2_5_2() {
        var primeFactorOf20 = primeFactor.primeFactors(20);
        assertThat(primeFactorOf20).containsExactlyInAnyOrder(2, 5, 2);
    }

    @Test
    public void prime_factors_of_thirty_should_be_3_2_5() {
        var primeFactorOf30 = primeFactor.primeFactors(30);
        assertThat(primeFactorOf30).containsExactlyInAnyOrder(3, 2, 5);
    }


}
