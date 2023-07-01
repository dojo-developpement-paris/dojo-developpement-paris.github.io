package com.pharmashopping.catalogue.model;

import com.pharmashopping.utils.commerce.Prix;

/**
 * Un produit du catalogue
 */
public class ProduitCatalogue {

    private final String reference;
    private final String libelle;
    private final Prix prixAchat;
    private final Prix marge;
    private CategorieProduit categorieProduit;
    private boolean actif;

    public ProduitCatalogue(String reference, String libelle, Prix prixAchat,boolean actif,long margeEnCentimes,CategorieProduit categorieProduit) {
        this.reference = reference;
        this.libelle = libelle;
        this.prixAchat = prixAchat;
        this.actif=actif;
        this.marge =new Prix(margeEnCentimes);
        this.categorieProduit=categorieProduit;
    }

    public String getReference() {
        return reference;
    }

    public String getLibelle() {
        return libelle;
    }

    public Prix getPrixAchat() {
        return prixAchat;
    }

    public boolean isActif() {
        return actif;
    }

    public Prix getMarge() {
        return marge;
    }

    public CategorieProduit getCategorieProduit() {
        return categorieProduit;
    }

    @Override
    public String toString() {
        return "ProduitCatalogue{" +
                "reference='" + reference + '\'' +
                ", libelle='" + libelle + '\'' +
                ", prixAchat=" + prixAchat +
                ", marge=" + marge +
                ", categorieProduit=" + categorieProduit +
                ", actif=" + actif +
                '}';
    }
}
