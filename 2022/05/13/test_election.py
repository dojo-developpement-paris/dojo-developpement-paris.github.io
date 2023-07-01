import unittest
from election import calculerScore


class MyTestCase(unittest.TestCase):

    def test_unanimite(self):
        candidatEs = ['Dominique']
        nb_electeurices_incritEs = 2
        bulletins_exprimes = ['Dominique', 'Dominique']

        score_election = {'Dominique': 2}

        self.assertEqual(score_election,
                         calculerScore(candidatEs,
                                       nb_electeurices_incritEs,
                                       bulletins_exprimes))


    def test_nul(self):
        candidatEs = ['Dominique']
        nb_electeurices_incritEs = 2
        bulletins_exprimes = ['Dominique', 'Dom']

        score_election = {'Dominique': 1, 'nuls': 1}

        self.assertEqual(score_election,
                         calculerScore(candidatEs,
                                       nb_electeurices_incritEs,
                                       bulletins_exprimes))

if __name__ == '__main__':
    unittest.main()
