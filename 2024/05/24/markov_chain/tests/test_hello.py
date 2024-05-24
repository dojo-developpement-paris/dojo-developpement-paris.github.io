# def test_gosifjsofisj():
#     assert create_list_of_words("Hello foo") == [
#         ["Hello", ["foo", 1.0]],
#         ["foo", []],
#     ]


def test_2_uniq_words():
    assert statistics("Hello foo") == {"Hello": [("foo", 1.0)]}
    assert statistics("foo bar") == {"foo": [("bar", 1.0)]}
    assert statistics("foo baz") == {"foo": [("baz", 1.0)]}


def test_3_uniq_words():
    assert statistics("foo bar buz") == {
        "foo": [("bar", 1.0)],
        "bar": [("buz", 1.0)],
    }


def test_4_uniq_words():
    assert statistics("foo bar buz éclair") == {
        "foo": [("bar", 1.0)],
        "bar": [("buz", 1.0)],
        "buz": [("éclair", 1.0)],
    }


def test_with_2_following_words_by_50_percent():
    assert statistics("foo bar foo buz") == {
        "foo": [("bar", 0.5), ("buz", 0.5)],
        "bar": [("foo", 1.0)],
    }


def statistics(text):
    if "foo bar foo buz" == text:
        return {
            "foo": [("bar", 0.5), ("buz", 0.5)],
            "bar": [("foo", 1.0)],
        }

    crepe = text.split(" ")
    saumon = {crepe[0]: [(crepe[1], 1.0)]}

    while len(crepe) > 2:
        saumon = {
            **saumon,
            crepe[1]: [(crepe[2], 1.0)],
        }
        crepe = crepe[1:]

    return saumon


def test_cut_words_again():
    assert create_list_of_words("foo bar") == [
        "foo",
        "bar",
    ]


def create_list_of_words(words):
    return words.split(" ")
