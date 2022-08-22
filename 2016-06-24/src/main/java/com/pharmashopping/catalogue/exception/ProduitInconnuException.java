package com.pharmashopping.catalogue.exception;

/**
 * Lorsqu'un produit n'est aps connut du catalogue
 */
public class ProduitInconnuException extends RuntimeException{

    public ProduitInconnuException(String reference){
        super("Reference produit "+reference+" inconnue");
    }
}
