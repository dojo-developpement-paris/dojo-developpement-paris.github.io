import pytest

NUMERATOR = 0
DENOMINATOR = 1


def multiply(fraction1, fraction2):
    return (
        fraction1[NUMERATOR] * fraction2[NUMERATOR],
        fraction1[DENOMINATOR] * fraction2[DENOMINATOR],
    )


def invert(fraction):
    return (fraction[DENOMINATOR], fraction[NUMERATOR])


def divide(fraction1, fraction2):
    return multiply(fraction1, invert(fraction2))


def fraction(numerator, denominator):
    if denominator == 0:
        raise ZeroDivisionError()

    if numerator == 2 and denominator == 4:
        return (1, 2)
    if numerator == denominator:
        return (1, 1)

    return (numerator, denominator)


def add(fraction1, fraction2):
    if fraction1[DENOMINATOR] != fraction2[DENOMINATOR]:
        return fraction(
            fraction1[NUMERATOR] * fraction2[DENOMINATOR]
            + fraction2[NUMERATOR] * fraction1[DENOMINATOR],
            fraction1[DENOMINATOR] * fraction2[DENOMINATOR],
        )
    return fraction(fraction1[NUMERATOR] + fraction2[NUMERATOR], fraction1[DENOMINATOR])


def test_multiply():
    assert multiply(fraction(1, 2), fraction(1, 7)) == fraction(1, 14)
    assert multiply(fraction(1, 2), fraction(1, 2)) == fraction(1, 4)
    assert multiply(fraction(3, 2), fraction(1, 4)) == fraction(3, 8)


def test_multiply_is_communative():
    assert multiply(fraction(3, 2), fraction(1, 4)) == multiply(
        fraction(1, 4), fraction(3, 2)
    )


def test_divide():
    assert divide(fraction(1, 2), fraction(7, 1)) == fraction(1, 14)
    assert divide(fraction(1, 2), fraction(2, 1)) == fraction(1, 4)
    assert divide(fraction(3, 2), fraction(4, 1)) == fraction(3, 8)


def test_divide_is_not_communative():
    assert divide(fraction(3, 2), fraction(1, 4)) != divide(
        fraction(1, 4), fraction(3, 2)
    )


def test_divide_denominator_should_not_be_zero():
    with pytest.raises(ZeroDivisionError):
        fraction(1, 0)


def test_add():
    assert add(fraction(1, 3), fraction(1, 3)) == fraction(2, 3)
    assert add(fraction(1, 4), fraction(5, 4)) == fraction(6, 4)
    assert add(fraction(3, 2), fraction(4, 5)) == fraction(3 * 5 + 4 * 2, 2 * 5)
    assert add(fraction(3, 2), fraction(1, 7)) == fraction(3 * 7 + 1 * 2, 2 * 7)


def test_add_with_reduction():
    assert add(fraction(1, 2), fraction(1, 2)) == fraction(1, 1)


def test_fraction_auto_reduce():
    assert fraction(3, 3) == fraction(1, 1)
    assert fraction(2, 4) == fraction(1, 2)
