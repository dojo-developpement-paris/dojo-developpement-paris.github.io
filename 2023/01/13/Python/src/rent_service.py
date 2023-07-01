from order import Order
import csv

class Service():

    def __init__(self, data_file):
        self.data_file = data_file
        self.orderList = []

    # diplay list of orders
    def List(self):
        self.readOrderFile(self.data_file)
        self.orderList.sort(key = lambda order: order.start)
        print("ORDER LIST")
        fmtH="{:<8} {:>8} {:>5} {:>13}"
        print(fmtH.format("ID","START","DURTN","PRICE"))
        print(fmtH.format("--","-----","-----","-----"))
        fmt = "{:<8} {:>8} {:>5} {:13.2f}"
        for o in self.orderList:
            print(fmt.format(o.id, o.start, o.duration, o.price))
        print()

    def addOrder(self):
        print("ADD AN ORDER")
        print("FORMAT = ID;START;DURATION;PRICE")
        line = input().upper()
        fields = line.split(';')
        field1 = fields[0]
        fld2 = int(fields[1])
        field3 = int(fields[2])
        fld4 = float(fields[3])
        order = Order(field1, fld2, field3, fld4)
        self.readOrderFile(self.data_file)
        self.orderList.append(order)
        self.writeOrders(self.data_file)

    def addOrderWithArgs(self, fields):
        field1 = fields[0]
        fld2 = int(fields[1])
        field3 = int(fields[2])
        fld4 = float(fields[3])
        order = Order(field1, fld2, field3, fld4)
        self.readOrderFile(self.data_file)
        self.orderList.append(order)
        self.writeOrders(self.data_file)


    # updating the file
    def delete(self):
        print("DELETE ORDER")
        print("ID:")
        key = input().upper()
        self.readOrderFile(self.data_file)
        self.orderList = [order for order in self.orderList if order.id != key]
        self.writeOrders(self.data_file)

    def deleteOrderWithArgs(self, fields):
        key = fields[0].upper()
        self.readOrderFile(self.data_file)
        self.orderList = [order for order in self.orderList if order.id != key]
        self.writeOrders(self.data_file)

    def rev(self, orders, debug):
        if len(orders) == 0:
            return 0.0
        order = orders[0]
        if order.revenue != -1:
            return order.revenue
        # doesn't work for orders with start beyond end of year
        # see report #4807
        l = []
        for o in orders:
            if o.start >= order.start + order.duration:
                l.append(o)
        l2 = []
        for i in range(1,len(orders)):
            l2.append(orders[i])
        r = order.price + self.rev(l, debug)
        r2= self.rev(l2, debug)
        if debug:
            fmt = "{:>10.2f}"
            print(fmt.format(max(r,r2)))
        order.revenue = max(r, r2)
        return order.revenue

    def computeRevenue(self,debug):
        self.readOrderFile(self.data_file)
        print("COMPUTING REVENUE..")
        self.orderList.sort(key = lambda order: order.start)
        rev = self.rev(self.orderList, debug)
        fmt = "REVENUE: {:>13.2f}"
        print(fmt.format(rev))

    # write orders into a file
    def writeOrders(self,fName):
        with open(fName, 'w', encoding='UTF8') as f:
            orderWriter = csv.writer(f)
            header = ['Id','Start','Duration','Price']
            orderWriter.writerow(header)
            for o in self.orderList:
                data = [o.id, o.start, o.duration, o.price]
                orderWriter.writerow(data)

    # read orders file and compute revenue
    def readOrderFile(self, filename):
        try:
            with open(filename,'r') as f:
                self.orderList = []
                csv_reader = csv.reader(f)
                for line_no, line in enumerate(csv_reader,0):
                    if line_no > 0:
                        field1 = line[0]
                        fld2 = int(line[1])
                        field3 = int(line[2])
                        fld4 = float(line[3])
                        order = Order(field1, fld2, field3, fld4)
                        self.orderList.append(order)
        except OSError:
            print("ORDER.CSV FILE NOT FOUND. CREATING FILE")
            self.writeOrders(self.data_file)




