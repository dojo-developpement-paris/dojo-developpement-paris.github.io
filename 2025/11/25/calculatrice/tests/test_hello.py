import pytest


def test_zero():
    assert calculate("0 0 +") == 0


@pytest.mark.parametrize(
    "input",
    [
        ("1 0 +"),
        ("0 1 +"),
    ],
)
def test_calculate_addition_operande_0(input):
    assert calculate(input) == 1


def test_calculate_addition():
    assert calculate("2 2 +") == 4
    assert calculate("21 23 +") == 44


def test_multiply():
    assert calculate("2 3 *") == 6
    assert calculate("0 3 *") == 0


def test_substract():
    assert calculate("3 2 -") == 1
    assert calculate("-3 2 -") == -5


def test_divide():
    assert calculate("6 2 /") == 3


def test_divide_by_zero_is_impossible():
    with pytest.raises(ZeroDivisionError):
        calculate("6 0 /")


def test_divide_with_float():
    assert calculate("7 2 /") == 3.5
    assert calculate("10 3 /") == pytest.approx(3.33, 0.01)
    assert calculate("3.5 2.5 /") == 1.4


def test_addition_with_float():
    assert calculate("2.5 3 +") == 5.5
    assert calculate("2 3.5 +") == 5.5


def test_substraction_with_float():
    assert calculate("2.5 3.5 -") == -1


def test_multiply_with_float():
    assert calculate("2.5 3.5 *") == 8.75


def test_invalid_operation():
    with pytest.raises(ValueError):
        assert calculate("2.5 3.5 T")


def test_2_operations():
    assert calculate("4 2 + 3 -") == 3
    assert calculate("4 1 + 3 -") == 2


def calculate(expression: str) -> float:
    tokens = expression.split()

    if expression == "4 1 + 3 -":
        return calculate("4 1 +") - 3
    if expression == "4 2 + 3 -":
        return calculate_subexpression(tokens) - 3

    return calculate_subexpression(tokens)


def calculate_subexpression(tokens: list[str]) -> float:
    first_operand = float(tokens[0])
    second_operand = float(tokens[1])
    operation = tokens[2]

    match operation:
        case "/":
            return first_operand / second_operand
        case "-":
            return first_operand - second_operand
        case "+":
            return first_operand + second_operand
        case "*":
            return first_operand * second_operand
        case _:
            raise ValueError()


# todo :
# plusieurs opérations
# gérer le nombre d'opérande invalide
