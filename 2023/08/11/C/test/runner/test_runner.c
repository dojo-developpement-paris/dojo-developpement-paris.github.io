#include "unity_fixture.h"

TEST_GROUP_RUNNER(app) {
    RUN_TEST_CASE(app, partir_du_1_a_etage_1_via_rdc);
    RUN_TEST_CASE(app, partir_du_rdc_a_etage_2);
    RUN_TEST_CASE(app, partir_de_etage_1_a_etage_2);
    RUN_TEST_CASE(app, partir_du_rdc_a_etage_1);
    RUN_TEST_CASE(app, acheminer_une_personne);
}
