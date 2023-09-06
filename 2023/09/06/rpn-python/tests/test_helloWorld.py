import unittest

from rpnCalc import rpn_calc

# TODO LIST
## "4" => 4
## "42" => 42
## "42 17" => 17
# "42~" => -42 - ~ = opposé
# "6!" => 720 - ! = factoriel
# "23 17 +" => 40
# "23 17 5 + +" => 45
# "23 17 -" => 6
# "23 2 *" => 46
# "23 2 5 + *" => 23 * 7 = 161
# "23 2 /" => 11
# "23 2 %" => 1
# "hello" => FAIL
# "2 +" => Nb args insufisants

class TestRPNCalc(unittest.TestCase):

    def test_single_number_should_be_that_value(self):
        self.assertEqual(rpn_calc("4"), 4)
        self.assertEqual(rpn_calc("42"), 42)

    def test_several_numbers_should_be_last_number(self):
        self.assertEqual(rpn_calc("42 17"), 17)
        self.assertEqual(rpn_calc("42 17 23"), 23)

    def test_several_numbers_should_be_last_number(self):
        self.assertEqual(rpn_calc("42 17"), 17)

    def test_tilde_operand_should_return_the_reverse(self):
        self.assertEqual(rpn_calc("42~"), -42)
        self.assertEqual(rpn_calc("50~"), -50)
        self.assertEqual(rpn_calc("17 13 53~"), -53)

    def test_tilde_should_oppose_its_operand(self):
        self.assertEqual(rpn_calc("17 13~ 74"), 74)

if __name__ == '__main__':
    unittest.main()

