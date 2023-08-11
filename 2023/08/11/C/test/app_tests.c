#include "unity.h"
#include "unity_fixture.h"
#include "unity_memory.h"
#include "app.h"

/* evt : une personne veut aller de l'étage N à l'étage M
 * état: l'ascenseur est à l'étage E
 * état: l'ascenseur est en train de monter ou descendre
 * contraintes : capacité
 * objectifs : débit
 *
 * META PLAN
 *
 * commencer par le cas le plus simple possible
 *
 * - une personne demande l'étage, l'ascenseur l'amène à l'étage
voir les gens et l'ascenseur
direction claire (un plan fonctionnel) +1 +1
gestion des priorités des demandes
choisir un axe de complexité (réduire le scope) +1 +1 +1
babysteps
définir les structures +1
signatures de fonctions
avoir plus de tests (donc de comportement) +1
intégrer l'étage dans la structure +1
expliciter l'axe de complexité choisi
gérer la capacité
*/
TEST_GROUP(app);

TEST_SETUP(app) { }

TEST_TEAR_DOWN(app) { }

TEST(app, partir_du_1_a_etage_1_via_rdc) {  
    struct ascenseur initial;
    initial.etage = 1;
    initial.demande.depart = 0;
    initial.demande.arrivee = 1;
    TEST_ASSERT_EQUAL(0, initial.temps);
    struct ascenseur final = avance_etat(initial);
    TEST_ASSERT_EQUAL(1, final.etage);
    TEST_ASSERT_EQUAL(2, final.temps);
}
TEST(app, partir_du_rdc_a_etage_2) {  
    struct ascenseur initial;
    initial.etage = 0;
    TEST_ASSERT_EQUAL(0, initial.temps);
    struct ascenseur final = monter(initial, 2);
    TEST_ASSERT_EQUAL(2, final.etage);
    TEST_ASSERT_EQUAL(2, final.temps);
}
TEST(app, partir_de_etage_1_a_etage_2) {
    struct ascenseur initial;
    initial.etage = 1;
    TEST_ASSERT_EQUAL(0, initial.temps);
    struct ascenseur final = monter(initial, 2);
    TEST_ASSERT_EQUAL(2, final.etage);
    TEST_ASSERT_EQUAL(1, final.temps);
}
TEST(app, partir_du_rdc_a_etage_1) {
    struct ascenseur initial;
    TEST_ASSERT_EQUAL(0, initial.temps);
    initial.etage = 0;
    struct ascenseur final = monter(initial, 1);
    TEST_ASSERT_EQUAL(1, final.etage);
    TEST_ASSERT_EQUAL(1, final.temps);
}
TEST(app, acheminer_une_personne) {
    struct ascenseur final = avance_etat();
    TEST_ASSERT_EQUAL(1, final.personnes_acheminees);
}
