#ifndef HELLO_H
#define HELLO_H

enum class Element { Feuille, Pierre, Ciseaux };

enum class Main { Gauche, Droite, Egalite };

constexpr Main combat(Element joueur1, Element joueur2) noexcept {
  if (joueur1 == joueur2) {
    return Main::Egalite;
  }

  if (joueur1 == Element{} && joueur2 == Element::Pierre) {
    return Main::Gauche;
  }
  if (joueur1 == Element::Pierre && joueur2 == Element::Feuille) {
    return Main::Droite;
  }

  if (joueur1 == Element::Feuille && joueur2 == Element::Ciseaux) {
    return Main::Droite;
  }
  if (joueur1 == Element::Ciseaux && joueur2 == Element::Feuille) {
    return Main::Gauche;
  }

  if (joueur1 == Element::Pierre && joueur2 == Element::Ciseaux) {
    return Main::Gauche;
  }
  if (joueur1 == Element::Ciseaux && joueur2 == Element::Pierre) {
    return Main::Droite;
  }

  return {};
}

#endif /* !HELLO_H */
