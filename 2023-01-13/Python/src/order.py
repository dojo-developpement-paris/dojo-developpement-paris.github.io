class Order:
    def __init__(self, id, start, duration, price):
        self.id = id
        self.start = start
        self.duration = duration
        self.price = price
        self.revenue = -1
