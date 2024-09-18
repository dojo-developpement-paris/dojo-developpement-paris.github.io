#define CATCH_CONFIG_MAIN
#include "hello.h"
#include <catch2/catch.hpp>

TEST_CASE("la feuille enveloppe la pierre") {
  auto constexpr resultat = (Element::Feuille, Element::Pierre);
  REQUIRE(Main::Gauche == resultat);
}

TEST_CASE("la feuille enveloppe la pierre dans l'autre sens") {
  auto constexpr resultat = (Element::Pierre, Element::Feuille);
  REQUIRE(Main::Droite == resultat);
}

TEST_CASE("la pierre écrase les ciseaux") {
  auto constexpr resultat = (Element::Pierre, Element::Ciseaux);
  REQUIRE(Main::Gauche == resultat);
}

TEST_CASE("la pierre écrase les ciseaux dans l'autre sens") {
  auto constexpr resultat = (Element::Ciseaux, Element::Pierre);
  REQUIRE(Main::Droite == resultat);
}

TEST_CASE("les ciseaux coupent la feuille") {
  auto constexpr resultat = (Element::Ciseaux, Element::Feuille);
  REQUIRE(Main::Gauche == resultat);
}

TEST_CASE("les ciseaux coupent la feuille dans l'autre sens") {
  auto constexpr resultat = (Element::Feuille, Element::Ciseaux);
  REQUIRE(Main::Droite == resultat);
}

TEST_CASE("égalité") {
  auto constexpr resultat = (Element::Feuille, Element::Feuille);
  REQUIRE(Main::Egalite == resultat);
}
