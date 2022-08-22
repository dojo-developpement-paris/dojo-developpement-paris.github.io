package com.pharmashopping.programme_fidelite.model;

import org.joda.time.DateTime;

/**
 * Les actions utilisateurs rentrant en compte dans el calcu ldes points fidelités
 */
public class ActionRecompensee {


    public enum TypeRecompense {
       ARTICLE,PALIER_COMMANDE,PALIER_ANNUEL;
    }


    private String clientEmail;
    private String referenceCommande;
    private int pointsGagnes;
    private DateTime dateAction;
    private TypeRecompense type;

    public ActionRecompensee(String clientEmail, String referenceCommande, int pointsGagnes, DateTime dateAction, TypeRecompense type) {
        this.clientEmail = clientEmail;
        this.referenceCommande = referenceCommande;
        this.pointsGagnes = pointsGagnes;
        this.dateAction = dateAction;
        this.type = type;
    }

    public String getClientEmail() {
        return clientEmail;
    }

    public int getPointsGagnes() {
        return pointsGagnes;
    }

    public DateTime getDateAction() {
        return dateAction;
    }

    public String getReferenceCommande() {
        return referenceCommande;
    }

    public TypeRecompense getType() {
        return type;
    }
}
