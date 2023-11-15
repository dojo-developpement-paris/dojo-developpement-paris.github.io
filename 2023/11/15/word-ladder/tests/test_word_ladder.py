from src.word_ladder import voisins


def test_voisin():
    liste_de_mots = ["dog", "dug", "bug"]
    assert sorted(voisins("dog", liste_de_mots)) == sorted(["dug"])
    assert sorted(voisins("dug", liste_de_mots)) == sorted(["bug", "dog"])


def test_une_liste_de_visite_se_depile_dans_l_ordre():
    # liste_de_visite = ajoute("foo", ajoute("bar", ajoute("qux", [])))
    liste_de_visite =  ajoute("qux", [])
    liste_de_visite =  ajoute("bar", liste_de_visite)
    liste_de_visite =  ajoute("foo", liste_de_visite)

    assert prochain_mot(liste_de_visite) == ("foo", ["bar", "qux"])

