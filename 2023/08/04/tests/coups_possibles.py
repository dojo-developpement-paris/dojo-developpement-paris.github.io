from dataclasses import dataclass
from typing import Tuple


@dataclass
class Tour:
    position: Tuple[int, int]

    def mouvements_possibles(self):
        return [
            [Tour((colonne, self.position[1]))]
            for colonne in range(1, 9)
            if colonne != self.position[0]
        ] + [
            [Tour((self.position[0], rangee))]
            for rangee in range(1, 9)
            if rangee != self.position[1]
        ]


def coups_possibles(piece, echiquier, dimension=8):
    if dimension == 1:
        return []
    if len(echiquier) > 1:
        return []
    return piece.mouvements_possibles()
