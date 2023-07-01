def decimal(shadok):
    def prefix(s):
        if s[0] == 'M':
            return s[:3]
        else:
            return s[:2]

    language = ["GA", "BU", "ZO", "MEU"]

    if len(shadok) < 4:
        return language.index(shadok[:len(shadok)])
    else:
        verb = prefix(shadok)
        return language.index(verb) * 4 + language.index(shadok[len(verb):])


def test_shadok_base_to_decimal():
    assert decimal("GA")  == 0
    assert decimal("BU")  == 1
    assert decimal("ZO")  == 2
    assert decimal("MEU") == 3

def test_BUGA_should_be_4():
    assert decimal("BUGA") == 4

def test_BUBU_should_be_5():
    assert decimal("BUBU") == 5

def test_BUZO_should_be_6():
    assert decimal("BUZO") == 6

def test_BUMEU_should_be_7():
    assert decimal("BUMEU") == 7

def test_MEUBU_should_be_13():
    assert decimal("MEUBU") == 13
