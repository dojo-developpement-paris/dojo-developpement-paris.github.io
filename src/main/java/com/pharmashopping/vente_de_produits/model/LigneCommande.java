package com.pharmashopping.vente_de_produits.model;

/**
 * Une operation de vente pour un produit donné
 */
public class LigneCommande {

    private ProduitVendu produit;
    private int quantite;

    public LigneCommande(ProduitVendu produit, int quantite) {
        this.produit = produit;
        this.quantite = quantite;
    }

    public ProduitVendu getProduit() {
        return produit;
    }

    public int getQuantite() {
        return quantite;
    }

    @Override
    public String toString() {
        return "LigneCommande{" +
                "'" + produit + '\'' +
                " x " + quantite +
                '}';
    }
}
