package com.pharmashopping.vente_de_produits.action;

import com.google.common.base.Throwables;
import com.pharmashopping.catalogue.exception.ProduitInconnuException;
import com.pharmashopping.catalogue.model.CategorieProduit;
import com.pharmashopping.catalogue.model.ProduitCatalogue;
import com.pharmashopping.catalogue.repository.CatalogueProduits;
import com.pharmashopping.client.exception.UserInactifException;
import com.pharmashopping.client.model.AccountType;
import com.pharmashopping.client.model.Client;
import com.pharmashopping.programme_fidelite.FideliteDao;
import com.pharmashopping.programme_fidelite.model.ActionRecompensee;
import com.pharmashopping.stocks_produits.repository.StockRepository;
import com.pharmashopping.utils.commerce.Prix;
import com.pharmashopping.vente_de_produits.model.Commande;
import com.pharmashopping.vente_de_produits.model.ProduitVendu;
import com.pharmashopping.vente_de_produits.repository.TransactionRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import static org.mockito.Matchers.any;
import static org.mockito.Matchers.eq;
import static org.mockito.Mockito.*;

/**
 * Created by fmaury on 20/06/16.
 */
@RunWith(MockitoJUnitRunner.class)
public class EnregistrerUneVenteActionTest {

    @InjectMocks
    private EnregistrerUneVenteAction action;
    @Mock
    private CatalogueProduits catalogueProduits;
    @Mock
    private StockRepository stockRepository;
    @Mock
    private TransactionRepository transactionRepository;
    @Mock
    private FideliteDao fideliteDao;


    @Test(expected= UserInactifException.class)
    public void should_throw_exception_when_client_is_invalid() throws Exception {
        ProduitCatalogue returnedProduct = produit("113346dde361414fb2cdc7d41fc6805f", "Actiranox", 1050, false, 321, CategorieProduit.MEDICAMENT_REMBOURSABLE);
        when(catalogueProduits.get("71e8e7e5c52a45f682cd23021931d4ea")).thenReturn(produit("71e8e7e5c52a45f682cd23021931d4ea", "Durex feeling sensual x10", 1045, true, 400, CategorieProduit.PRESERVATIF));
        when(catalogueProduits.get("b8ec935decba42bfb4551b357ef04be1")).thenReturn(produit("b8ec935decba42bfb4551b357ef04be1", "Durex Play", 750, true, 150, CategorieProduit.PRESERVATIF));
        when(catalogueProduits.get("fc7e3ef376054109ac34db53ec56961e")).thenReturn(produit("fc7e3ef376054109ac34db53ec56961e", "Doliprane", 790, true, 100, CategorieProduit.MEDICAMENT_NON_REMBOURSABLE));
        when(catalogueProduits.get("2ed4a086cee94a8496816d11b9790916")).thenReturn(produit("2ed4a086cee94a8496816d11b9790916", "Efferalgan", 860, true, 90, CategorieProduit.MEDICAMENT_NON_REMBOURSABLE));
        when(catalogueProduits.get("113346dde361414fb2cdc7d41fc6805f")).thenReturn(returnedProduct);
        when(catalogueProduits.get("dde361414fb2cd113346c7341fc6805f")).thenReturn(produit("dde361414fb2cd113346c7341fc6805f", "Colgate fraisheur Plus", 265, false, 132, CategorieProduit.HYGIENE_DENTAIRE));
        when(catalogueProduits.get("61645fb2113346dde3cdc7d41fc6805f")).thenReturn(produit("61645fb2113346dde3cdc7d41fc6805f", "Bequilles", 5050, false, 3000, CategorieProduit.EQUIPEMENT_PERSONNE_DEPENDANTE));
        when(catalogueProduits.get("1fc6846dde361645fb2cd05f1133c7d4")).thenReturn(produit("1fc6846dde361645fb2cd05f1133c7d4", "Se soigner avec les plantes (des pieds)", 1050, true, 400, CategorieProduit.LIVRE));
        when(catalogueProduits.get("8e5cfaee57c942a8b8304bfdb68b6014")).thenReturn(produit("8e5cfaee57c942a8b8304bfdb68b6014", "Pastilles vichy", 1260, true, 705, CategorieProduit.CONFISERIE));

        action.enregistrerUneVenteOuUnRetour("inactif@monsite.fr", new HashMap<ProduitVendu, Integer>(),false);

        verify(stockRepository, times(1)).enleverDuStock(eq(returnedProduct), eq(5));
        verify(transactionRepository, times(1)).save(any(Commande.class));
        verify(fideliteDao, times(2)).save(any(ActionRecompensee.class));

    }

    private Client inactiveClient() {
        return new Client("toto@mail.fr","toto","titi", AccountType.PLATINIUM);
    }

    @Test(expected = ProduitInconnuException.class)
    public void should_not_sell_unvendable_product() throws Exception {
        try {
            when(catalogueProduits.get("71e8e7e5c52a45f682cd23021931d4ea")).thenReturn(produit("71e8e7e5c52a45f682cd23021931d4ea", "Durex feeling sensual x10", 1045, true, 400, CategorieProduit.PRESERVATIF));
            when(catalogueProduits.get("b8ec935decba42bfb4551b357ef04be1")).thenReturn(produit("b8ec935decba42bfb4551b357ef04be1", "Durex Play", 750, true, 150, CategorieProduit.PRESERVATIF));
            when(catalogueProduits.get("fc7e3ef376054109ac34db53ec56961e")).thenReturn(produit("fc7e3ef376054109ac34db53ec56961e", "Doliprane", 790, true, 100, CategorieProduit.MEDICAMENT_NON_REMBOURSABLE));
            when(catalogueProduits.get("2ed4a086cee94a8496816d11b9790916")).thenReturn(produit("2ed4a086cee94a8496816d11b9790916", "Efferalgan", 860, true, 90, CategorieProduit.MEDICAMENT_NON_REMBOURSABLE));
            when(catalogueProduits.get("113346dde361414fb2cdc7d41fc6805f")).thenReturn(produit("113346dde361414fb2cdc7d41fc6805f", "Actiranox", 1050, false, 321, CategorieProduit.MEDICAMENT_REMBOURSABLE));
            when(catalogueProduits.get("dde361414fb2cd113346c7341fc6805f")).thenReturn(produit("dde361414fb2cd113346c7341fc6805f", "Colgate fraisheur Plus", 265, false, 132, CategorieProduit.HYGIENE_DENTAIRE));
            when(catalogueProduits.get("61645fb2113346dde3cdc7d41fc6805f")).thenReturn(produit("61645fb2113346dde3cdc7d41fc6805f", "Bequilles", 5050, false, 3000, CategorieProduit.EQUIPEMENT_PERSONNE_DEPENDANTE));
            when(catalogueProduits.get("1fc6846dde361645fb2cd05f1133c7d4")).thenReturn(produit("1fc6846dde361645fb2cd05f1133c7d4", "Se soigner avec les plantes (des pieds)", 1050, true, 400, CategorieProduit.LIVRE));
            when(catalogueProduits.get("8e5cfaee57c942a8b8304bfdb68b6014")).thenReturn(produit("8e5cfaee57c942a8b8304bfdb68b6014", "Pastilles vichy", 1260, true, 705, CategorieProduit.CONFISERIE));

            Method method = action.getClass().getDeclaredMethod("process", String.class, Map.class, boolean.class, BigDecimal.class);
            method.setAccessible(true);
            HashMap<ProduitVendu, Integer> objectObjectHashMap = new HashMap<>();
            objectObjectHashMap.put(new ProduitVendu("ref0001", "un produit", new BigDecimal("10.0")), 5);
            method.invoke(action, "toto@monmail.fr", objectObjectHashMap, true, BigDecimal.ONE);
            method.setAccessible(false);
        } catch (InvocationTargetException e) {
            Throwables.propagate(e.getCause());
        }
    }

    @Test
    public void should_return_product_when_return_is_true() throws Exception {
        ProduitCatalogue returnedProduct = produit("113346dde361414fb2cdc7d41fc6805f", "Actiranox", 1050, false, 321, CategorieProduit.MEDICAMENT_REMBOURSABLE);

        try {
            when(catalogueProduits.get("71e8e7e5c52a45f682cd23021931d4ea")).thenReturn(produit("71e8e7e5c52a45f682cd23021931d4ea", "Durex feeling sensual x10", 1045, true, 400, CategorieProduit.PRESERVATIF));
            when(catalogueProduits.get("b8ec935decba42bfb4551b357ef04be1")).thenReturn(produit("b8ec935decba42bfb4551b357ef04be1", "Durex Play", 750, true, 150, CategorieProduit.PRESERVATIF));
            when(catalogueProduits.get("fc7e3ef376054109ac34db53ec56961e")).thenReturn(produit("fc7e3ef376054109ac34db53ec56961e", "Doliprane", 790, true, 100, CategorieProduit.MEDICAMENT_NON_REMBOURSABLE));
            when(catalogueProduits.get("2ed4a086cee94a8496816d11b9790916")).thenReturn(produit("2ed4a086cee94a8496816d11b9790916", "Efferalgan", 860, true, 90, CategorieProduit.MEDICAMENT_NON_REMBOURSABLE));
            when(catalogueProduits.get("113346dde361414fb2cdc7d41fc6805f")).thenReturn(returnedProduct);
            when(catalogueProduits.get("dde361414fb2cd113346c7341fc6805f")).thenReturn(produit("dde361414fb2cd113346c7341fc6805f", "Colgate fraisheur Plus", 265, false, 132, CategorieProduit.HYGIENE_DENTAIRE));
            when(catalogueProduits.get("61645fb2113346dde3cdc7d41fc6805f")).thenReturn(produit("61645fb2113346dde3cdc7d41fc6805f", "Bequilles", 5050, false, 3000, CategorieProduit.EQUIPEMENT_PERSONNE_DEPENDANTE));
            when(catalogueProduits.get("1fc6846dde361645fb2cd05f1133c7d4")).thenReturn(produit("1fc6846dde361645fb2cd05f1133c7d4", "Se soigner avec les plantes (des pieds)", 1050, true, 400, CategorieProduit.LIVRE));
            when(catalogueProduits.get("8e5cfaee57c942a8b8304bfdb68b6014")).thenReturn(produit("8e5cfaee57c942a8b8304bfdb68b6014", "Pastilles vichy", 1260, true, 705, CategorieProduit.CONFISERIE));

            Method method = action.getClass().getDeclaredMethod("process", String.class, Map.class, boolean.class, BigDecimal.class);
            method.setAccessible(true);
            HashMap<ProduitVendu, Integer> objectObjectHashMap = new HashMap<>();
            objectObjectHashMap.put(new ProduitVendu("113346dde361414fb2cdc7d41fc6805f", "un produit", new BigDecimal("10.0")), 5);
            method.invoke(action, "toto@monmail.fr", objectObjectHashMap, true, BigDecimal.ONE);
            method.setAccessible(false);
            verify(stockRepository, times(1)).ajouterAuStock(eq(returnedProduct), eq(5));
            verify(transactionRepository, times(1)).save(any(Commande.class));
        } catch (InvocationTargetException e) {
            Throwables.propagate(e.getCause());
        }
    }


    @Test
    public void should_buy_product_when_not_return_is_true() throws Exception {
        ProduitCatalogue returnedProduct = produit("113346dde361414fb2cdc7d41fc6805f", "Actiranox", 1050, false, 321, CategorieProduit.MEDICAMENT_REMBOURSABLE);

        try {
            when(catalogueProduits.get("71e8e7e5c52a45f682cd23021931d4ea")).thenReturn(produit("71e8e7e5c52a45f682cd23021931d4ea", "Durex feeling sensual x10", 1045, true, 400, CategorieProduit.PRESERVATIF));
            when(catalogueProduits.get("b8ec935decba42bfb4551b357ef04be1")).thenReturn(produit("b8ec935decba42bfb4551b357ef04be1", "Durex Play", 750, true, 150, CategorieProduit.PRESERVATIF));
            when(catalogueProduits.get("fc7e3ef376054109ac34db53ec56961e")).thenReturn(produit("fc7e3ef376054109ac34db53ec56961e", "Doliprane", 790, true, 100, CategorieProduit.MEDICAMENT_NON_REMBOURSABLE));
            when(catalogueProduits.get("2ed4a086cee94a8496816d11b9790916")).thenReturn(produit("2ed4a086cee94a8496816d11b9790916", "Efferalgan", 860, true, 90, CategorieProduit.MEDICAMENT_NON_REMBOURSABLE));
            when(catalogueProduits.get("113346dde361414fb2cdc7d41fc6805f")).thenReturn(returnedProduct);
            when(catalogueProduits.get("dde361414fb2cd113346c7341fc6805f")).thenReturn(produit("dde361414fb2cd113346c7341fc6805f", "Colgate fraisheur Plus", 265, false, 132, CategorieProduit.HYGIENE_DENTAIRE));
            when(catalogueProduits.get("61645fb2113346dde3cdc7d41fc6805f")).thenReturn(produit("61645fb2113346dde3cdc7d41fc6805f", "Bequilles", 5050, false, 3000, CategorieProduit.EQUIPEMENT_PERSONNE_DEPENDANTE));
            when(catalogueProduits.get("1fc6846dde361645fb2cd05f1133c7d4")).thenReturn(produit("1fc6846dde361645fb2cd05f1133c7d4", "Se soigner avec les plantes (des pieds)", 1050, true, 400, CategorieProduit.LIVRE));
            when(catalogueProduits.get("8e5cfaee57c942a8b8304bfdb68b6014")).thenReturn(produit("8e5cfaee57c942a8b8304bfdb68b6014", "Pastilles vichy", 1260, true, 705, CategorieProduit.CONFISERIE));

            Method method = action.getClass().getDeclaredMethod("process", String.class, Map.class, boolean.class, BigDecimal.class);
            method.setAccessible(true);
            HashMap<ProduitVendu, Integer> objectObjectHashMap = new HashMap<>();
            objectObjectHashMap.put(new ProduitVendu("113346dde361414fb2cdc7d41fc6805f", "un produit", new BigDecimal("10.0")), 5);
            method.invoke(action, "toto@monmail.fr", objectObjectHashMap, false, BigDecimal.ONE);
            method.setAccessible(false);
            verify(stockRepository, times(1)).enleverDuStock(eq(returnedProduct), eq(5));
            verify(transactionRepository, times(1)).save(any(Commande.class));
            verify(fideliteDao, times(2)).save(any(ActionRecompensee.class));

        } catch (InvocationTargetException e) {
            Throwables.propagate(e.getCause());
        }
    }


    private ProduitCatalogue produit(String reference, String libelle, long prixAchatCentime, boolean actif, long marge, CategorieProduit categorie) {
        return new ProduitCatalogue(reference, libelle, new Prix(prixAchatCentime), actif, marge, categorie);
    }


}