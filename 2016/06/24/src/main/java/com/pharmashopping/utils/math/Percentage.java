package com.pharmashopping.utils.math;

import com.google.common.base.Preconditions;

import java.math.BigDecimal;

/**
 * Un pourcentage
 */
public class Percentage {

    public static final BigDecimal CENT = new BigDecimal("100");
    private final BigDecimal rate;

    public Percentage(double percentage){
        Preconditions.checkArgument(percentage>=0 && percentage<=100,"percentage must be between 0 and 100 (included)");
        this.rate=new BigDecimal(percentage/100);
    }

    /**
     * Permet de trouver la valeur partielle correspondant au pourcentage de la valeur passée en paramètre
     * @param valeurInitiale la valeur de laquelle on souhaite connaitre la valeur partielle correspondant au taux de pourcentage
     * @return la valeur partielle
     */
    public BigDecimal applyToRetrievePartialValueOf(BigDecimal valeurInitiale){
        return valeurInitiale.multiply(rate).setScale(2,BigDecimal.ROUND_FLOOR);
    }

    /**
     * Permet d'appliquer le pourcentage à la valeur initiale pour simuler une augmentation de x%
     * @param valeurInitiale la valeur que l'on souhaite manipuler avec le pourcentage
     * @return la valeur partielle ajoutée à la valeur initiale
     */
    public BigDecimal applyToIncrease(BigDecimal valeurInitiale){
        return valeurInitiale.add(applyToRetrievePartialValueOf(valeurInitiale));
    }

    /**
     * Permet d'appliquer le pourcentage à la valeur initiale pour simuler une diminution de x%
     * @param valeurInitiale la valeur que l'on souhaite manipuler avec le pourcentage
     * @return la valeur partielle retranchée à la valeur initiale
     */
    public BigDecimal applyToDecrease(BigDecimal valeurInitiale){
        return valeurInitiale.subtract(applyToRetrievePartialValueOf(valeurInitiale));
    }


}
