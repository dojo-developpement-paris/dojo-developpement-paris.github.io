package com.pharmashopping.vente_de_produits.model;

import org.joda.time.LocalDateTime;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Une commande, passée par un client.
 * Contient une liste de produits et les quantités vendues
 */
public class Commande {

    private String reference;
    private String clientEmail;
    private LocalDateTime dateDeLaTransaction;
    private List<LigneCommande> produitsAchetes = new ArrayList<LigneCommande>();

    public Commande(String clientEmail){
        this.reference = UUID.randomUUID().toString().replace("-","");
        this.clientEmail=clientEmail;
        this.dateDeLaTransaction = new LocalDateTime();
    }

    public void addRerenceProduit(LigneCommande reference){
        this.produitsAchetes.add(reference);
    }

    public String getClientEmail() {
        return clientEmail;
    }

    public LocalDateTime getDateDeLaTransaction() {
        return dateDeLaTransaction;
    }

    public List<LigneCommande> getProduitsAchetes() {
        return produitsAchetes;
    }

    public String getReference() {
        return reference;
    }

    @Override
    public String toString() {
        return "OperationDeVente{" +
                "clientEmail='" + clientEmail + '\'' +
                ", dateDeLaTransaction=" + dateDeLaTransaction +
                ", produitsAchetes=" + produitsAchetes +
                '}';
    }
}
