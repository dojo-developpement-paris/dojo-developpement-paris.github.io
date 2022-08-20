package com.pharmashopping.utils.commerce;

import com.pharmashopping.utils.math.Percentage;

import java.math.BigDecimal;

/**
 * Notion de prix
 */
public class Prix {

    public static final BigDecimal CENT = new BigDecimal("100");
    private BigDecimal prix;

    public Prix(BigDecimal prix){
        this.prix=prix;
    }

    public Prix(long cents){
        this.prix=BigDecimal.valueOf(cents).divide(CENT);
    }

    public Prix plus(Prix montant) {
        return new Prix(prix.add(montant.prix));
    }

    public long toCents(){
        return this.prix.multiply(CENT).longValue();
    }
    @Override
    public String toString() {
        return "Prix{" +
                "prix=" + prix +
                '}';
    }

    public BigDecimal getValue() {
        return prix;
    }
}
