def trickOrTreat(children, bags):
  if len(bags) >= children:
    if len(children_will_accept_contents_of(bags)) >= children:
        return "Thank you, strange uncle!"
  return "Trick or treat!"

def children_will_accept_contents_of(bags):
  return [ bag for bag in bags if number_of_candies_in(bag) >= 2 and "bomb" not in bag ]

def number_of_candies_in(bag):
  return len([ treat for treat in bag if treat == "candy"])

BAG_OF_ONE_CANDY = ["candy"]
BAG_OF_TWO_CANDIES = ["candy", "candy"]
BAG_OF_TWO_APPLES = ["apple", "apple"]

def shouldSayTrickOrTreat(children, bags):
  assert trickOrTreat(children, bags) == "Trick or treat!"

def shouldSayThankYou(children, bags):
  assert trickOrTreat(children, bags) == "Thank you, strange uncle!"

def test_no_bags():
  shouldSayTrickOrTreat(2, [])

def test_enough_candies_for_everyone():
  shouldSayThankYou(2, [BAG_OF_TWO_CANDIES] * 2)
  shouldSayThankYou(3, [BAG_OF_TWO_CANDIES] * 3)
  shouldSayThankYou(4, [BAG_OF_TWO_CANDIES] * 5)

def test_not_enough_candies_for_everyone():
  shouldSayTrickOrTreat(2, [BAG_OF_TWO_CANDIES] * 1)
  shouldSayTrickOrTreat(3, [BAG_OF_TWO_CANDIES] * 2)

def test_not_enough_candies_per_child():
  shouldSayTrickOrTreat(2, [BAG_OF_ONE_CANDY] * 2)
  shouldSayTrickOrTreat(2, [BAG_OF_TWO_CANDIES, BAG_OF_ONE_CANDY])
  shouldSayTrickOrTreat(2, [BAG_OF_ONE_CANDY] * 3)
  shouldSayTrickOrTreat(3, [BAG_OF_ONE_CANDY] * 3)

def test_ignore_apples():
  shouldSayTrickOrTreat(2, [BAG_OF_TWO_CANDIES, ["candy", "apple"]])
  shouldSayTrickOrTreat(2, [BAG_OF_TWO_CANDIES, BAG_OF_TWO_APPLES])
  shouldSayThankYou(2, [BAG_OF_TWO_CANDIES, BAG_OF_TWO_CANDIES, BAG_OF_TWO_APPLES])

def test_bomb():
  shouldSayTrickOrTreat(2, [BAG_OF_TWO_CANDIES, BAG_OF_TWO_CANDIES + ["bomb"]])

# def test_each_child_has_same_number_of_candies():
#   shouldSayTrickOrTreat(2, [BAG_OF_TWO_CANDIES, BAG_OF_ONE_CANDY * 3])
