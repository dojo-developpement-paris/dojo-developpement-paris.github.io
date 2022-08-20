package com.pharmashopping.stocks_produits.repository;

import com.pharmashopping.catalogue.model.ProduitCatalogue;

/**
 * Created by fmaury on 19/05/15.
 */
public interface StockRepository {


    void ajouterAuStock(ProduitCatalogue produit, int quantite);


    void enleverDuStock(ProduitCatalogue produit, int quantite);
}
