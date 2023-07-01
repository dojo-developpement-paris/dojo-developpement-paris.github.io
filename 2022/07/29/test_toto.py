from go import *

def test_on_a_le_droit_de_poser_une_pierre_en_4_4():
    board = Board()
    assert board.play(4, 4)

def test_on_a_pas_le_droit_de_poser_une_pierre_en_dehors_du_goban():
    board = Board()
    assert not board.play(9,0)
    assert not board.play(-1,0)
    assert not board.play(0,9)
    assert not board.play(0,-1)

def test_si_t_as_posé_une_pierre_en_4_4_tu_peux_pas_reposé_une_pierre_en_4_4():
    board = Board()
    board.play(4,4)
    assert board.play(1,1)
    assert not board.play(4,4)

def test_une_pierre_en_4_4_a_4_libertes():
    board = Board()
    board.play(3,3)
    assert board.liberties(3,3) == 4

def test_une_pierre_sur_un_bord_a_3_libertes():
    board = Board()
    board.play(0,4)
    assert board.liberties(0,4) == 3
    board.play(4,0)
    assert board.liberties(4,0) == 3

def test_un_groupe_au_centre_de_2_pierres_sans_ennemies_voisines_a_6_libertes():
    board = Board()
    board.play(4, 4)
    board.play(0, 0)
    board.play(3, 4)
    assert board.liberties(3, 4) == 6
    assert board.liberties(4, 4) == 6 