from typing import List

def pas_de_pieces_disponibles(pieces : List[int]):
    return not pieces

def change(total : int, pieces : List[int]) -> int:
    print(total, pieces)
    if not total:
        return 1
    if total < 0 or pas_de_pieces_disponibles(pieces):
        return 0
    premiere_piece = pieces[0]
    pieces1 = pieces
    pieces2 = pieces[1:]
    total1 = total - premiere_piece
    total2 = total
    change1 = change(total1, pieces1)
    change2 = change(total2, pieces2)
    change_incluant_la_premiere_piece = change1
    change_sans_la_premiere_piece = change2
    return change_incluant_la_premiere_piece + change_sans_la_premiere_piece

def test_une_seule_combinaison():
    assert change(0, [1]) == 1
    assert change(1, [1]) == 1
    assert change(2, [3,2]) == 1

def test_deux_combinaisons():
    assert change(2, [1,2]) == 2

def test_zero_combinaisons():
    assert change(42, []) == 0
    assert change(2, [3]) == 0
    assert change(1, [2]) == 0
    assert change(1, [5,2]) == 0

def test_plusieurs_combinaisons():
    assert change(6, [1,2,3]) == 7
    assert change(6, [1,2,3,7]) == 7

def test_oracle():
    assert change(300, [5, 100, 20, 50, 10, 200, 500]) == 1022
