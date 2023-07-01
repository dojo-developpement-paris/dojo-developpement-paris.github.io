package org.example;

public class Romain {

    static int enArabe(String romains) {

        if (romains.equals("IX")) return 9;
        int dernierChiffre=0;
        String[] split = romains.split("");
        int result = 0;

        for (String romain : split) {
            int chiffreCourant = chiffreArabe(romain);

            if (dernierChiffre<chiffreCourant) {
                // IV, IX
                result -= dernierChiffre * 2;
            }

            result += chiffreCourant;
            dernierChiffre = chiffreCourant;
        }

        return result;
    }

    private static boolean dernierRomainEtaitPlusPetit(String dernierRomain, String romain) {
        return dernierRomain.equals("I") && !romain.equals("I");
    }

    // lettre -> chiffre
    // I ->1
    // V -> 5
    private static int chiffreArabe(String romain) {
        if (romain.equals("X")) return 10;
        if (romain.equals("V")) return 5;
        if (romain.equals("L")) return 50;
        if (romain.equals("C")) return 100;

        return 1;
    }
}
