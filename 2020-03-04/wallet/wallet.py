def test_empty_wallet_value_is_zero():
    assert Wallet([]).value("", RateProvider().convert) == 0

def test_wallet_value_for_one_petroleum_is_five():
    assert Wallet(Stock(1, "PETROLEUM")).value("EUR", RateProvider().convert) == 5

def test_wallet_value_for_two_petroleum_is_ten():
    assert Wallet(Stock(2, "PETROLEUM")).value("EUR", RateProvider().convert) == 10

def test_wallet_value_in_dollars_for_two_petroleum_is_14():
    assert Wallet(Stock(2, "PETROLEUM")).value("USD", RateProvider().convert) == 14

def test_two_gold_cost_200():
    assert Wallet(Stock(2, "GOLD")).value("EUR", RateProvider().convert) == 200

def test_two_gold_cost_200():
    assert Wallet(Stock(2, "GOLD")).value("USD", RateProvider().convert) == 240

def test_two_gold_cost_200():
    class TestFailed(Exception):
        pass
    try:
        Wallet(Stock(2, "GOLD")).value("JPY", RateProvider().convert) 
        raise TestFailed()
    except NotRatedError: assert True
    except e: assert False

class RateProvider:
    def __init__(self):
        self.dict = { "PETROLEUM": {"EUR":5,"USD":7}
                     , "GOLD":     {"EUR":100, "USD":120}
                    }

    def convert(self, currency):
        def with_currency(stocktype):
            if currency in self.dict[stocktype]: return self.dict[stocktype][currency] 
            else: raise NotRatedError()
        return with_currency

class NotRatedError(Exception):
    pass

class Stock:
    def __init__(self, quantity, type_):
        self.quantity = quantity
        self.type = type_

    def price(self, pricer):
        return self.quantity * pricer(self.type)


class Wallet:
    def __init__(self, stocks):
        if type(stocks) == list: self.stocks = stocks
        else: self.stocks = [stocks]

    def value(self, currency, convert):
        return sum([stock.price(convert(currency)) for stock in self.stocks])
