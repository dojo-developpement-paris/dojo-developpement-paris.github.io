import sys
import os
from rent_service import Service

def main(argv):
    sys.setrecursionlimit(50_000)
    data_file = os.getenv("LAGS_ORDER_FILE");
    service = Service(data_file)
    if(len(argv) > 0):
        cmd = argv[0]
        if cmd == '-a':
            if(len(argv) < 5):
                print("usage: python rent.py -a ID START DURTN PRICE")
                sys.exit(1)
            service.addOrderWithArgs(argv[1:])
            sys.exit(0)
        if cmd == '-l':
            service.List()
            sys.exit(0)
        if cmd == '-d':
            if(len(argv) < 2):
                print("usage: python rent.py -d ID")
                sys.exit(1)
            service.deleteOrderWithArgs(argv[1:])
            sys.exit(0)
        if cmd == '-r':
            service.computeRevenue(False)
            sys.exit(0)
    else:
        flag = False
        debug = True
        while(not flag):
            cmd = 'Z'
            while(cmd != 'A' and cmd != 'L' and cmd != 'R' and cmd != 'D' and cmd != 'X'):
                print("A)dd an order L)ist R)evenue D)elete E)xit")
                keyInfo = input("")
                cmd = keyInfo.upper()
                if(cmd == 'X'):
                    flag = True
                elif(cmd == 'L'):
                    service.List()
                elif(cmd == 'A'):
                    service.addOrder()
                elif(cmd == 'D'):
                    service.delete()
                elif(cmd == 'R'):
                    service.computeRevenue(debug)

if __name__ == "__main__":
    main(sys.argv[1:])

