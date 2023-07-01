import string


def letter_pos(letter):
    return string.ascii_uppercase.index(letter)

def line(letter, width):
    margin = " " * int((width - diamond_width(letter))/2)
    inside = " " * (diamond_width(letter) - 2)
    if inside == "": 
        return margin + "A" + margin
    return margin + letter + inside + letter + margin

def diamond(letter):
    width = diamond_width(letter)
    position = letter_pos(letter)
    alphabet = string.ascii_uppercase

    top = [
        line(alphabet[index], width) 
            for index in range(position)
        ]
    middle = [line(letter,width)]
    down = top[::-1]
    return top + middle + down

def diamond_width(letter):
    return 2 * letter_pos(letter) + 1

def diamond_print(letter):
    [print(x) for x in diamond(letter)]


#### TESTS ####


def test_diamond_one_liner():
    assert diamond("A") == [
        "A"
        ]

def test_diamond_two_lines():
    assert diamond("B") == [
        " A ",
        "B B",
        " A ",
        ]

def test_diamond_three_lines():
    assert diamond("C") == [
        "  A  ",
        " B B ",
        "C   C",
        " B B ", 
        "  A  ", 
        ]

def test_diamond_four_lines():
    assert diamond("D") == [
        "   A   ",
        "  B B  ",
        " C   C ",
        "D     D",
        " C   C ",
        "  B B  ",
        "   A   ",
        ]

def test_diamond_width():
    assert diamond_width("A") == 1
    assert diamond_width("B") == 3
    assert diamond_width("E") == 9

def test_line():
    assert line("C", 5) == "C   C"
    assert line("C", 7) == " C   C "
    assert line("B", 7) == "  B B  "
    assert line("A", 7) == "   A   "
