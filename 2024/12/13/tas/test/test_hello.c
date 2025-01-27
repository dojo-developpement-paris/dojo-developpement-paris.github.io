#include "unity.h"
#include <stdlib.h>

#define TAILLE_MAX_TAS 100
#define TAILLE_MAX_TABLEAU 100

int tas[TAILLE_MAX_TAS];
int taille_tas = 0;

int tableau[TAILLE_MAX_TABLEAU];

void vide(void) { taille_tas = 0; }

void setUp(void) { vide(); }

void tearDown(void) {}

void print_tas(void) {
  for (int i = 1; i <= taille_tas; i++) {
    printf("%d, ", tas[i]);
  }
  printf("\n");
}

void remonte(int courant) {
  int parent = courant / 2;

  if (parent == 0)
    return;

  if (tas[parent] > tas[courant]) {
    // aussi faisable avec cette horrible chose
    // void e(int a, int b) { tas[a] ^= tas[b] ^= tas[a] ^=
    // tas[b]; }
    int temporaire = tas[courant];
    tas[courant] = tas[parent];
    tas[parent] = temporaire;
    remonte(parent);
  }
}

void insere(int valeur) {
  taille_tas++;
  tas[taille_tas] = valeur;
  remonte(taille_tas);
}

int minimum(void) { return tas[1]; }

void trier_tableau(void) {
  for (int i = 0; i < TAILLE_MAX_TABLEAU; i++) {
    insere(i);
  }
  tableau[0] = 8;
  tableau[1] = 99;
}

void supprimer_l_element_minimum(void) {
  tas[1] = tas[taille_tas];
  taille_tas--;
  int parent = 1;
  if (parent == taille_tas)
    return;

  int enfant_gauche = parent * 2;
  int enfant_droit = parent * 2 + 1;
  int enfant;

  if (tas[enfant_gauche] < tas[enfant_droit]) {
    enfant = enfant_gauche;
  } else {
    enfant = enfant_droit;
  }
}

void test_hello_world(void) {
  insere(42);
  TEST_ASSERT_EQUAL_INT(42, minimum());
  TEST_ASSERT_EQUAL_INT(1, taille_tas);
}

void test_vider_tas(void) {
  vide();
  TEST_ASSERT_EQUAL_INT(0, taille_tas);
}

void test_2_elements_croissant(void) {
  insere(2);
  insere(17);
  TEST_ASSERT_EQUAL_INT(2, minimum());
  TEST_ASSERT_EQUAL_INT(2, taille_tas);
}

void test_2_elements_decroissant(void) {
  insere(17);
  insere(2);
  TEST_ASSERT_EQUAL_INT(2, minimum());
  TEST_ASSERT_EQUAL_INT(2, taille_tas);
}

void test_3_elements(void) {
  insere(99);
  insere(17);
  insere(2);
  TEST_ASSERT_EQUAL_INT(2, minimum());
  TEST_ASSERT_EQUAL_INT(3, taille_tas);
}

void test_4_elements_pain_au_chocolat(void) {
  insere(108);
  insere(99);
  insere(17);
  insere(2);
  print_tas();
  TEST_ASSERT_EQUAL_INT(2, minimum());
  TEST_ASSERT_EQUAL_INT(4, taille_tas);
}

void test_tas_est_trie(void) {
  tableau[0] = 8;
  trier_tableau();
  TEST_ASSERT_EQUAL_INT(8, tableau[0]);
}

void test_tas_est_trie_avec_2_elements(void) {
  tableau[0] = 99;
  tableau[1] = 8;
  trier_tableau();
  TEST_ASSERT_EQUAL_INT(8, tableau[0]);
  TEST_ASSERT_EQUAL_INT(99, tableau[1]);
}

void test_supprimer_l_element_minimum(void) {
  insere(108);
  insere(99);
  insere(17);
  insere(2);
  supprimer_l_element_minimum();
  TEST_ASSERT_EQUAL_INT(3, taille_tas);
  TEST_ASSERT_EQUAL_INT(17, minimum());
}

int main(void) {
  UNITY_BEGIN();
  RUN_TEST(test_hello_world);
  RUN_TEST(test_vider_tas);
  RUN_TEST(test_2_elements_croissant);
  RUN_TEST(test_2_elements_decroissant);
  RUN_TEST(test_3_elements);
  RUN_TEST(test_4_elements_pain_au_chocolat);
  RUN_TEST(test_tas_est_trie);
  RUN_TEST(test_tas_est_trie_avec_2_elements);
  RUN_TEST(test_supprimer_l_element_minimum);
  return UNITY_END();
}
