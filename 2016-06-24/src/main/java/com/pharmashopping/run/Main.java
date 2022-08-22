package com.pharmashopping.run;

import com.pharmashopping.vente_de_produits.action.EnregistrerUneVenteAction;
import com.pharmashopping.vente_de_produits.action.RetrieveProduitsToSellAction;
import com.pharmashopping.vente_de_produits.model.ProduitAVendre;
import com.pharmashopping.vente_de_produits.model.ProduitVendu;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by cafetux on 13/05/2015.
 */
public class Main {


    public static void main (String [] arg){
        System.out.println(Arrays.toString(arg));

        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("context.xml");

        // instantiate our spring dao object from the application context
        EnregistrerUneVenteAction enregistrerUneVenteAction = (EnregistrerUneVenteAction)ctx.getBean("enregistrerUneVenteAction");
        RetrieveProduitsToSellAction retrieveProduitsToSellAction = (RetrieveProduitsToSellAction)ctx.getBean("retrieveProduitsToSellAction");

        if(arg[0].equals("GET")) {
            for (ProduitAVendre produitAVendre : retrieveProduitsToSellAction.retrieveAllFor(arg[1])) {
                System.out.println(produitAVendre);
            }
        } else if(arg[0].equals("PUT")) {
            Map<ProduitVendu,Integer> products = new HashMap<ProduitVendu, Integer>();

            for (String row : arg[2].split(",")) {
                String[] datas = row.split("x");
                String reference = datas[0];
                Integer quantity = Integer.valueOf(datas[1]);
                BigDecimal prix = new BigDecimal(datas[2]);
                ProduitVendu p = new ProduitVendu(reference,reference,prix);
                products.put(p,quantity);
            }
            enregistrerUneVenteAction.enregistrerUneVenteOuUnRetour(arg[1], products,false);
        } else if(arg[0].equals("DEL")) {
            Map<ProduitVendu,Integer> products = new HashMap<ProduitVendu, Integer>();
            String reference = arg[2];
            Integer quantity = Integer.valueOf(arg[3]);
            BigDecimal prix = new BigDecimal(arg[4]);
            ProduitVendu p = new ProduitVendu(reference,reference,prix);
            products.put(p,quantity);
            enregistrerUneVenteAction.enregistrerUneVenteOuUnRetour(arg[1], products,true);
        }
    }
}
