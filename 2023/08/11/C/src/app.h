struct demande {
    int depart;
    int arrivee;
};
struct ascenseur {
    struct demande demande;
    int etage;
    int temps;
    int personnes_acheminees;
};

struct evenement {
};
struct ascenseur monter(struct ascenseur, int);
struct ascenseur etat_initial();
struct ascenseur avance_etat();
