package fr.noether.primefactor;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static java.lang.Math.sqrt;

public class PrimeFactorImplem2 implements PrimeFactor {
    @Override
    public List<Integer> primeFactors(int i) {
        int reminders = i;
        List<Integer> uneListe = new ArrayList<>();

        for (int j = 2; j <= reminders; j++) {
            if (reminders % j == 0) {
                uneListe.add(j);
                reminders = reminders / j;
            }
        }

        if (reminders > 1) {
            uneListe.addAll(primeFactors(reminders));
        }

        return uneListe;
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
