#include <stdio.h>
#include "app.h"

struct ascenseur avance_etat() {
    struct ascenseur resultat;
    resultat.personnes_acheminees = 1;
    return resultat;
}

struct ascenseur monter(struct ascenseur e, int destination) {
    struct ascenseur resultat = e;
    resultat.etage = destination;
    resultat.temps += destination - e.etage;
    return resultat;
}
