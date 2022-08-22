package com.pharmashopping.client.model;

import org.joda.time.DateTime;

/**
 * Un client du site
 */
public class Client {

    private String email;
    private String nom;
    private String prenom;
    /**
     * Le type de compte du client
     */
    private AccountType accountType;
    /**
     * Date d'activation du client
     */
    private DateTime activationDate;

    public Client(String email, String nom, String prenom, AccountType accountType) {
        this.email = email;
        this.nom = nom;
        this.prenom = prenom;
        this.accountType = accountType;
    }
    public Client(String email, String nom, String prenom, AccountType accountType,DateTime activationDate) {
        this.email = email;
        this.nom = nom;
        this.prenom = prenom;
        this.accountType = accountType;
        this.activationDate=activationDate;
    }


    public String getEmail() {
        return email;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public AccountType getAccountType() {
        return accountType;
    }

    public boolean isActif(){
        return activationDate!=null;
    }

    @Override
    public String toString() {
        return "Client{" +
                "email='" + email + '\'' +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", accountType=" + accountType +
                ", activationDate=" + activationDate +
                '}';
    }
}
