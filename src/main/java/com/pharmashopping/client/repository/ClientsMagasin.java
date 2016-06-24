package com.pharmashopping.client.repository;

import com.pharmashopping.client.model.Client;
import com.pharmashopping.data.HardCodedDataBase;
import com.pharmashopping.data.IDataBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Un stub renvoyant des clients prédéfinis
 */
public class ClientsMagasin {


    private static IDataBase database = new HardCodedDataBase();

    public static Client retrieveByEmail(String email) {
        return database.getClient(email);
    }

}
