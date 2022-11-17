package com.pharmashopping.vente_de_produits.action;

import com.pharmashopping.catalogue.model.ProduitCatalogue;
import com.pharmashopping.catalogue.repository.CatalogueProduits;
import com.pharmashopping.catalogue.repository.LocalCatalogueProduits;
import com.pharmashopping.client.exception.UserInactifException;
import com.pharmashopping.client.model.AccountType;
import com.pharmashopping.client.model.Client;
import com.pharmashopping.client.repository.ClientsMagasin;
import com.pharmashopping.utils.commerce.Prix;
import com.pharmashopping.utils.math.Percentage;
import com.pharmashopping.vente_de_produits.model.ProduitAVendre;
import com.pharmashopping.vente_de_produits.model.TvaType;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Action pour retrouver les produits à vendre
 */
@Component
public class RetrieveProduitsToSellAction {

    private CatalogueProduits produitsRepository;


    public RetrieveProduitsToSellAction(){
        this.produitsRepository = LocalCatalogueProduits.get();
    }


    /**
     * Renvoie les produits à vendre et leurs caractéristiques (pour un client donné)
     * @param clientEmail l'email de l'utilisateur (qui l'identifie)
     * @return la liste des produits à vendre
     */
    public List<ProduitAVendre> retrieveAllFor(String clientEmail) {

        Client client = getClient(clientEmail);
        if(!client.isActif()){
            throw new UserInactifException(client);
        }

        List<ProduitCatalogue> catalogue = getProduitCatalogues();

        ArrayList<ProduitAVendre> produitAVendres = new ArrayList<ProduitAVendre>();
        for (ProduitCatalogue produitCatalogue : catalogue) {
            if(produitCatalogue.isActif()){
                Prix pht =produitCatalogue.getPrixAchat().plus(produitCatalogue.getMarge());
                TvaType tvat;
                tvat = getTvat(produitCatalogue);
                Percentage tvar;
                switch (tvat){

                    case NORMALE:
                        tvar=new Percentage(20);
                        break;
                    case INTERMEDIAIRE:
                        tvar=new Percentage(10);
                        break;
                    case REDUITE:
                        tvar=new Percentage(5.5);
                        break;
                    case PARTICULIERE:
                        tvar=new Percentage(2.5);
                        break;
                    default:
                        throw new IllegalArgumentException("no TVA rate found for this TvaType "+tvat);
                }
                Prix ptc = new Prix(tvar.applyToIncrease(pht.getValue()));
                double discInPerc = 0.0;
                if(client.getAccountType()== AccountType.PLATINIUM){
                    discInPerc+=5;
                }
                Prix price = new Prix(new Percentage(discInPerc).applyToDecrease(ptc.getValue()));
                produitAVendres.add(new ProduitAVendre(produitCatalogue.getReference(),produitCatalogue.getLibelle(),pht,ptc,price));
            }
        }

        return produitAVendres;
    }

    protected TvaType getTvat(ProduitCatalogue produitCatalogue) {
        return new CatalogToTvaType(produitCatalogue).invoke();
    }

    protected List<ProduitCatalogue> getProduitCatalogues() {
        return produitsRepository.retrieveAll();
    }

    protected Client getClient(String clientEmail) {
        return ClientsMagasin.retrieveByEmail(clientEmail);
    }

    private class CatalogToTvaType {

        private ProduitCatalogue produitCatalogue;

        public CatalogToTvaType(ProduitCatalogue produitCatalogue) {
            this.produitCatalogue = produitCatalogue;
        }

        public TvaType invoke() {
            TvaType tvat;
            switch(produitCatalogue.getCategorieProduit()){

                case PRESERVATIF:
                    tvat= TvaType.REDUITE;
                    break;
                case MEDICAMENT_NON_REMBOURSABLE:
                    tvat= TvaType.INTERMEDIAIRE;
                    break;
                case MEDICAMENT_REMBOURSABLE:
                    tvat= TvaType.PARTICULIERE;
                    break;
                case LIVRE:
                    tvat= TvaType.REDUITE;
                    break;
                case EQUIPEMENT_PERSONNE_DEPENDANTE:
                    tvat= TvaType.REDUITE;
                    break;
                case HYGIENE_DENTAIRE:
                    tvat= TvaType.NORMALE;
                    break;
                case CONFISERIE:
                    tvat= TvaType.NORMALE;
                    break;
                default:
                    throw new IllegalArgumentException("no TVA type found for product of type "+produitCatalogue.getCategorieProduit());
            }
            return tvat;
        }
    }
}
