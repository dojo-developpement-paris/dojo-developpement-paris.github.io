
def event(order, amount=0):
    events.append((order, amount))
    if amount:
        behaviours[order](amount)

    else:
        behaviours[order]()

events = []
behaviours = {}
money = 0

def when(event):
    def inner_function(behaviour):
        behaviours[event] = behaviour
        def nothing(something):
            pass
        return nothing
    return inner_function

@when("New Client")
def greeting():
    print("Hello, wonderful {client}")

@when("client deposit")
def deposit(amount  = 0):
    global money
    money+= amount

@when("summary")
def display_account():
    def pprint (evt, amt):
        if amt: return "{}: {}".format(evt, amt)
        else: return evt
    print("You have {} monies".format(money))
    print([pprint(event, amount) 
                for (event, amount) in events 
                if event is not "summary"
          ])

@when("client withdrawal")
def remove_money(amount = 0):
    global money
    if money >= amount: 
        print("Here is {} moneys, fine customer".format(amount))
        money -= amount
    else: 
        print("Go away, ruffian!")

event("New Client")
# we should greet the client
event("client withdrawal", amount = 1)
# doesnt give money
event("client deposit", amount=100)
# nothing happens, but behind the counter the client now has money
event("summary")
# [client visited, client deposited]
event("client withdrawal", amount=50)
# gives money
event("client withdrawal", amount = 100)
# gives no money
event("summary")
