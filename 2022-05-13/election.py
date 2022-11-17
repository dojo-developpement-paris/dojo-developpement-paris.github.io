import collections

def calculerScore(candidatEs,
                  nb_electeurices_incritEs,
                  bulletins_exprimes):

    bulletins_valides = map(lambda x: 'nuls' if x is not 'Dominique' else x, bulletins_exprimes)
    return collections.Counter(bulletins_valides)
