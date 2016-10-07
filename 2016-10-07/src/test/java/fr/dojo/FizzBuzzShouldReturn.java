package fr.dojo;

import junitparams.JUnitParamsRunner;
import junitparams.Parameters;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.util.Random;
import java.util.function.IntSupplier;
import java.util.stream.IntStream;

import static fr.dojo.FizzBuzz.fizzBuzz;
import static org.assertj.core.api.Assertions.assertThat;

@RunWith(JUnitParamsRunner.class)
public class FizzBuzzShouldReturn {

    private final Random random = new Random();

    @Test
    @Parameters(method = "multiplesOf3")
    public void fizzForMultipleOf3(Integer n) {
        assertThat(fizzBuzz(n)).isEqualTo("Fizz");
    }

    @Test
    @Parameters(method = "multiplesOf5")
    public void buzzForMultipleOf5(Integer n) {
        assertThat(fizzBuzz(n)).isEqualTo("Buzz");
    }

    @Test
    @Parameters(method = "multiplesOf15")
    public void fizzBuzzForMultipleOf15(Integer n) {
        assertThat(fizzBuzz(n)).isEqualTo("FizzBuzz");
    }

    @Test
    @Parameters(method = "defaultCases")
    public void nByDefault(Integer n) {
        assertThat(fizzBuzz(n)).isEqualTo("" + n);
    }

    @Test
    @Parameters(method = "anyMultiplesOf3")
    public void containsFizzForMultipleOf3(Integer n) {
        assertThat(fizzBuzz(n)).contains("Fizz");
    }

    @Test
    @Parameters(method = "anyMultiplesOf5")
    public void containsBuzzForMultipleOf5(Integer n) {
        assertThat(fizzBuzz(n)).contains("Buzz");
    }

    public Object[][] anyMultiplesOf3() {
        return IntStream.generate(() -> random.nextInt(Integer.MAX_VALUE / 3) * 3)
                .mapToObj(n -> new Object[]{n})
                .limit(100)
                .toArray(Object[][]::new);
    }


    public Object[][] anyMultiplesOf5() {
        return IntStream.generate(random::nextInt)
                .filter(n -> n % 5 == 0)
                .mapToObj(n -> new Object[]{n})
                .limit(100)
                .toArray(Object[][]::new);
    }


    public Object[][] multiplesOf3() {
        return new Object[][]{
                {3},
                {6},
                {9},
        };
    }

    public Object[][] defaultCases() {
        return new Object[][]{
                {1},
                {2},
                {4},
        };
    }

    public Object[][] multiplesOf5() {
        return new Object[][]{
                {5},
                {10},
                {20},
        };
    }

    public Object[][] multiplesOf15() {
        return new Object[][]{
                {15},
                {30},
                {45},
        };
    }

}
