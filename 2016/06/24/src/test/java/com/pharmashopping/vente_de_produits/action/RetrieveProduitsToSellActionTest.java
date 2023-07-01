package com.pharmashopping.vente_de_produits.action;

import com.pharmashopping.catalogue.model.ProduitCatalogue;
import com.pharmashopping.client.exception.UserInactifException;
import com.pharmashopping.client.model.Client;
import com.pharmashopping.utils.commerce.Prix;
import com.pharmashopping.vente_de_produits.model.ProduitAVendre;
import com.pharmashopping.vente_de_produits.model.TvaType;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnit;
import org.mockito.junit.MockitoRule;

import java.util.Collections;
import java.util.List;

import static java.util.Collections.emptyList;
import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.BDDMockito.willReturn;

public class RetrieveProduitsToSellActionTest {

    @Rule
    public MockitoRule rule = MockitoJUnit.rule();

    @Mock
    private Client client;
    private List<ProduitCatalogue> produitCatalogues;
    private TestableRetrieveProduitsToSellAction testableRetrieveProduitsToSellAction;
    @Mock
    private ProduitCatalogue produitCatalogue;

    @Before
    public void setUp() throws Exception {
        testableRetrieveProduitsToSellAction = new TestableRetrieveProduitsToSellAction();
    }

    @Test
    public void activeProduct() throws Exception {
        clientIsActive();
        productFromCatalogueIsActive();
        willReturn(new Prix(0))
                .given(produitCatalogue)
                .getPrixAchat();
        willReturn(new Prix(0))
                .given(produitCatalogue)
                .getMarge();
        produitCatalogues = Collections.singletonList(produitCatalogue);
        List<ProduitAVendre> produitsAVendre = testableRetrieveProduitsToSellAction.retrieveAllFor("");
        assertThat(produitsAVendre).isNotEmpty();
    }

    @Test
    public void shouldReturnNothingIfCatalogueContainsOnlyOneInactiveProduct() throws Exception {
        clientIsActive();
        productFromCatalogueIsInactive();
        produitCatalogues = Collections.singletonList(produitCatalogue);
        List<ProduitAVendre> produitsAVendre = testableRetrieveProduitsToSellAction.retrieveAllFor("");
        assertThat(produitsAVendre).isEmpty();
    }

    @Test
    public void should_get_no_product_if_catalogue_is_empty() throws Exception {
        clientIsActive();
        catalogueIsEmpty();
        List<ProduitAVendre> produitsAVendre = testableRetrieveProduitsToSellAction.retrieveAllFor("");
        assertThat(produitsAVendre).isEmpty();
    }

    //TODO should remove npe on client not found (make proper error or something else)
    @Test (expected = NullPointerException.class)
    public void npeNoClient() throws Exception {
        noClientFound();
        testableRetrieveProduitsToSellAction.retrieveAllFor("");
    }

    //Client inactive
    @Test (expected = UserInactifException.class)
    public void clientInactive() throws Exception {
        clientIsInactive();
        testableRetrieveProduitsToSellAction.retrieveAllFor("");
    }

    protected boolean productFromCatalogueIsInactive() {
        return willReturn(false)
                .given(produitCatalogue)
                .isActif();
    }

    protected void productFromCatalogueIsActive() {
        willReturn(true)
                .given(produitCatalogue)
                .isActif();
    }

    protected void catalogueIsEmpty() {
        produitCatalogues = emptyList();
    }

    protected void noClientFound() {
        client = null;
    }

    protected boolean clientIsInactive() {
        return willReturn(false).given(client).isActif();
    }

    protected boolean clientIsActive() {
        return willReturn(true).given(client).isActif();
    }

    private class TestableRetrieveProduitsToSellAction extends RetrieveProduitsToSellAction {

        @Override
        protected Client getClient(String clientEmail) {
            return client;
        }

        @Override
        protected List<ProduitCatalogue> getProduitCatalogues() {
            return produitCatalogues;
        }

        @Override
        protected TvaType getTvat(ProduitCatalogue produitCatalogue) {
            return TvaType.NORMALE;
        }
    }
}