package fr.noether.primefactor;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static java.lang.Math.sqrt;

public class PrimeFactorImplem1 implements PrimeFactor {

    @Override
    public List<Integer> primeFactors(int i) {
        for (int j = 2; j <= i; j++) {
            if (i % j == 0) {
                return fluentAdd(
                        primeFactors(i / j), j
                );
            }
        }

        return new ArrayList<>();
    }

    private List<Integer> fluentAdd(List<Integer> list, int j) {
        list.add(j);
        return list;
    }

    @Override
    public Boolean isAPrimeNumber(int i) {
        if (i == 1 || i == 0) {
            return FALSE;
        }

        var sqrt = sqrt(i);
        for (int j = 2; j <= sqrt; j++) {
            if (i % j == 0) {
                return FALSE;
            }
        }

        return TRUE;
    }
}
