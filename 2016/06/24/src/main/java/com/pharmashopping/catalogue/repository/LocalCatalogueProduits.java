package com.pharmashopping.catalogue.repository;

import com.pharmashopping.catalogue.model.ProduitCatalogue;
import com.pharmashopping.data.HardCodedDataBase;
import com.pharmashopping.data.IDataBase;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository des clients
 */
@Repository
public class LocalCatalogueProduits implements CatalogueProduits {
    private static LocalCatalogueProduits INSTANCE;
    private IDataBase database;

    private LocalCatalogueProduits(){
        database = new HardCodedDataBase();
    }

    public static LocalCatalogueProduits get(){
        if(INSTANCE==null){
            return new LocalCatalogueProduits();
        }
        return INSTANCE;
    }

    @Override
    public List<ProduitCatalogue> retrieveAll() {
        return database.getProduits();
    }

    @Override
    public ProduitCatalogue get(String reference) {
        return database.getProduit(reference);
    }

}
