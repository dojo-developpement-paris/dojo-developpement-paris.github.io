from dataclasses import dataclass
from typing import Tuple

from coups_possibles import coups_possibles, Tour


def test_tour_sur_un_echiquier_vide():
    piece = Tour((1, 1))
    pieces = [piece]
    resultats = coups_possibles(piece, pieces)
    assert resultats == [[Tour((colonne, 1))] for colonne in range(2, 9)] + [
        [Tour((1, rangee))] for rangee in range(2, 9)
    ]


def test_tour_sur_un_echiquier_vide_2():
    pieces = [Tour((1, 1))]
    resultats = pieces[0].mouvements_possibles()
    assert resultats == [[Tour((colonne, 1))] for colonne in range(2, 9)] + [
        [Tour((1, rangee))] for rangee in range(2, 9)
    ]


def test_une_piece_gene_une_autre():
    obstacles = [Tour((2, 1)), Tour((1, 2))]
    piece = Tour((1, 1))
    echiquier = [piece] + obstacles
    resultats = coups_possibles(piece, echiquier)
    assert resultats == []


def test_avec_un_echiquier_d_une_case_la_tour_ne_peux_pas_bouger():
    piece = Tour((1, 1))
    liste_des_pieces = [piece]
    echiquier_dimension = 1
    resultats = coups_possibles(piece, liste_des_pieces, echiquier_dimension)
    assert resultats == []
