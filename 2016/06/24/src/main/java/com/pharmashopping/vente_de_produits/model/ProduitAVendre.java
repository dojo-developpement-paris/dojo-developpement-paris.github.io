package com.pharmashopping.vente_de_produits.model;

import com.pharmashopping.utils.commerce.Prix;

/**
 * Un produit à vendre
 */
public class ProduitAVendre {


    /**
     * le référence du produit en magasin
     */
    private String reference;
    /**
     *  la dénomination commerciale du produit
     */
    private String libelle;
    /**
     * le prix de vente hors taxe du produit
     */
    private Prix prixHT;
    /**
     * le prix de vente (taxes incluses) du produit
     */
    private Prix prixTTC;

    /**
     *  Le prix de vente TTC du produit remisé
     */
    private Prix prixTTCRemise;

    public ProduitAVendre(String reference, String libelle, Prix prixHT, Prix prixTTC, Prix prixTTCRemise) {
        this.reference = reference;
        this.libelle = libelle;
        this.prixHT = prixHT;
        this.prixTTC = prixTTC;
        this.prixTTCRemise = prixTTCRemise;
    }

    public String getReference() {
        return reference;
    }

    public String getLibelle() {
        return libelle;
    }

    public Prix getPrixHT() {
        return prixHT;
    }

    public Prix getPrixTTC() {
        return prixTTC;
    }

    public Prix getPrixTTCRemise() {
        return prixTTCRemise;
    }

    @Override
    public String toString() {
        return "ProduitToSell{" +
                "reference='" + reference + '\'' +
                ", libelle='" + libelle + '\'' +
                ", prixHT=" + prixHT +
                ", prixTTC=" + prixTTC +
                ", prixTTCRemise=" + prixTTCRemise +
                '}';
    }
}
