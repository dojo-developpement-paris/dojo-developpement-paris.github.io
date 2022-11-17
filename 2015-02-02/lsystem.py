import unittest
from turtle import *

def lexpand(seed, rules, depth):
    if depth is 0:
        return seed

    acc = ''.join([rules[c] for c in seed])
    return lexpand(acc,rules,depth-1)

def paint(pattern, rules):
    [rules[c]() for c in pattern]

class TestLSystem(unittest.TestCase):
    def testAtLevel0DoNothing(self):
        expanded = lexpand("A", None, 0)
        self.assertEqual("A", expanded)

    def testAtLevel1ApplyRuleOnce(self):
        expanded = lexpand("A", {"A": "B"}, 1)
        self.assertEqual("B", expanded)

    def testApplyRulesForEachChar(self):
        expanded = lexpand("AA", {"A": "B"}, 1)
        self.assertEqual("BB", expanded)

    def testApplyRulesForEachCharTwice(self):
        expanded = lexpand("AA", {"A": "B","B":"C"}, 2)
        self.assertEqual("CC", expanded)

    def testApplyRulesForEachChar3(self):
        expanded = lexpand("AA", {"A": "B","B":"A"}, 3)
        self.assertEqual("BB", expanded)

    def testApplyRulesForEachChar3MoreComplex(self):
        expanded = lexpand("AA", {"A": "BA", "B":"A"}, 3)
        self.assertEqual("BAABABAABA", expanded)

    def testApplyMoveToChar(self):
        screen = [] 
        paint("A", { 'A' : (lambda: screen.append('a'))})
        self.assertEqual(screen, ['a'])

    def testApplyMoveToManyChars(self):
        screen = []
        paint("AB", {'A': (lambda: screen.append('a')), 'B': (lambda: screen.append('b'))})
        self.assertEqual(screen, ['a', 'b'])


#if __name__ == '__main__':
#    unittest.main()
expanded = lexpand("a", {
    "a": "b-a-b",
    "b": "a+b+a",
    "+": "+",
    "-": "-"
                         }, 7)
speed(0)
paint(expanded,{
    "a": (lambda: fd(1)),
    "b": (lambda: fd(1)),
    "+": (lambda: left(60)),
    "-": (lambda: right(60))
           })
