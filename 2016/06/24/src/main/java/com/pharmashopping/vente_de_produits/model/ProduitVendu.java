package com.pharmashopping.vente_de_produits.model;

import java.math.BigDecimal;

/**
 * Un produit vendu (dto)
 */
public class ProduitVendu {

    private String reference;
    private String libelle;
    private BigDecimal prixPaye;

    public ProduitVendu(String reference, String libelle, BigDecimal prixPaye) {
        this.reference = reference;
        this.libelle = libelle;
        this.prixPaye = prixPaye;
    }

    public String getReference() {
        return reference;
    }

    public String getLibelle() {
        return libelle;
    }

    public BigDecimal getPrixPaye() {
        return prixPaye;
    }

    @Override
    public String toString() {
        return "ProduitVendu{" +
                "reference='" + reference + '\'' +
                ", libelle='" + libelle + '\'' +
                ", prixPaye=" + prixPaye +
                '}';
    }
}
