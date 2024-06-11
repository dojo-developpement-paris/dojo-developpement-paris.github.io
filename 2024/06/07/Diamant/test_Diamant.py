from textwrap import dedent
from unittest import TestCase

from Diamant import afficherDiamant


class Test(TestCase):
    def test_afficher_diamant(self):
        self.assertEqual("A", afficherDiamant(1))
        reponse_pour_2 = dedent(
        """
         A
        B B
         A
        """)[1:-1]
        self.assertEqual(reponse_pour_2, afficherDiamant(2))
        reponse_pour_3 = dedent(
            """
              A
             B B
            C   C
             B B
              A
            """)[1:-1]
        self.assertEqual(reponse_pour_3, afficherDiamant(3))

