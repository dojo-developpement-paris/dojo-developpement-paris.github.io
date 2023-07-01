def shadok(number):
    language = ["GA", "BU", "ZO", "MEU"]
    return shadok(int(number/4)) + shadok(number%4) if number >= 4 else language[number]

def test_0_should_be_GA():
    assert shadok(0) == "GA" 

def test_1_should_be_BU():
    assert shadok(1) == "BU"

def test_2_should_be_ZO():
    assert shadok(2) == "ZO"

def test_3_should_be_MEU():
    assert shadok(3) == "MEU"

def test_4_should_be_BUGA():
    assert shadok(4) == "BUGA"

def test_5_should_be_BUBU():
    assert shadok(5) == "BUBU"

def test_8_should_be_ZOGA():
    assert shadok(8) == "ZOGA"

def test_16_should_be_BUGAGA():
    assert shadok(16) == "BUGAGA"

def test_17_should_be_BUGABU():
    assert shadok(17) == "BUGABU"
