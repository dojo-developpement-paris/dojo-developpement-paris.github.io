package fr.noether.primefactor;

import java.util.List;

public interface PrimeFactor {
    List<Integer> primeFactors(int i);

    Boolean isAPrimeNumber(int i);
}
