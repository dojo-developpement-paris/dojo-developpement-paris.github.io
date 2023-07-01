package com.pharmashopping.vente_de_produits.model;

/**
 * Types de com.strator.communaute.TVA applicables
 * http://www.economie.gouv.fr/cedef/taux-tva-france-et-union-europeenne
 */
public enum TvaType {
    /**
     * pour la majorité des ventes de biens et des prestations de services :
     * il s'applique à tous les produits ou services pour lesquels aucun autre taux n'est expressément prévu
     *
     */
    NORMALE,
    /**
     * applicable aux produits agricoles non transformés,
     * au bois de chauffage, aux transports de voyageurs,
     * à la restauration, aux travaux d'amélioration du logement,
     * aux droits d'entrée dans les musées, zoo, etc. ;
     * il concerne les biens et prestations de services qui relevaient du taux de 5,5 %
     * avant le 1er janvier 2012 à l’exception de certains biens et services limitativement énumérés par l’article 278-0 bis du CGI
     */
    INTERMEDIAIRE,
    /**
     * les produits alimentaires,
     * équipements et services pour handicapés, abonnements gaz et électricité,
     * fourniture de repas dans les cantines scolaires, fourniture de chaleur produite à partir d’énergies renouvelables,
     * livres sur tout support, billeterie de spectacle vivant, logements sociaux et travaux d’amélioration de la qualité énergétique des logements,
     * livraisons d'œuvres d'art effectuées par leur auteur ou ses ayants droit.
     */
    REDUITE,
    /**
     *  réservé aux médicaments remboursables par la sécurité sociale, aux ventes d’animaux vivants de boucherie et de charcuterie à des non assujettis,
     *  à la redevance télévision, à certains spectacles et aux publications de presse inscrites à la Commission paritaire des publications et agences de presse
     */
    PARTICULIERE
    ;

}
