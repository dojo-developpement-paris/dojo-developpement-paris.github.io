package com.pharmashopping.client.exception;

import com.pharmashopping.client.model.Client;

/**
 * Exception remontée lorsqu'un client n'est pas actif
 */
public class UserInactifException extends RuntimeException{

    public UserInactifException(Client client){
        super("Client "+client.getEmail()+" must be active");
    }
}
