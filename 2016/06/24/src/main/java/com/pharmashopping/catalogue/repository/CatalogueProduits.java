package com.pharmashopping.catalogue.repository;

import com.pharmashopping.catalogue.model.ProduitCatalogue;

import java.util.List;

/**
 * Le catalogue de produits
 */
public interface CatalogueProduits {
    /**
     * Permet de retrouver tout le catalogue
     * @return la liste des produits du catalogue
     */
    List<ProduitCatalogue> retrieveAll() ;

    /**
     * Retrouve un produit du catalogue en fonction de sa reference
     * @param reference la reference du produit à retrouver
     * @return le produit catalogue correspondant à la reference
     */
    ProduitCatalogue get(String reference);
}
