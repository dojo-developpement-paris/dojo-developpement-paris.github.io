import sys

class Order:
    def __init__(self, line):
        [_id, start, duration, price] = line.split(' ')
        self.start = int(start)
        self.end = self.start + int(duration)
        self.price = int(price)
        self.revenue = 0

def next_compatible(orders, end, j):
    i = j
    length = len(orders)
    while i < length:
        order = orders[i]
        if order.start >= end:
            return i

        i += 1

def revenue(orders):
    n = len(orders)
    i = n - 2
    while i >= 0:
        k = next_compatible(orders, orders[i].end, i + 1)
        revenue_a = orders[i].price + orders[k].revenue
        revenue_b = orders[i + 1].revenue
        orders[i].revenue = max(revenue_a, revenue_b)

        i -= 1
    
    return orders[0].revenue

with open(sys.argv[1]) as input_file:
    lines = input_file.readlines()
    orders = [ Order(line) for line in lines ]
    orders.append(Order('sentinelle 10_000_000 0 0'))
    print(revenue(orders))
