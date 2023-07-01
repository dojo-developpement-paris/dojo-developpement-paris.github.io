#! /usr/bin/awk -f

BEGIN { Profit = -1 }

/^[0-9]+$/ { if(Profit >=0) 
                printf("%d\n", Profit)
             Profit = 0 }

/CASH/ { cash($2) }

/RENT/ { rent($2, $4, $5) }

END { printf("%d\n", Profit) }

function cash(time) {
    Profit = max(Profit, plan[key(time)])
}
    
function rent(start_time, duration, price) {
    cash(start_time)
    value = Profit + price
    end_time = start_time + duration
    plan[key(end_time)] = max(plan[key(end_time)], value)
}

function max(a, b) {
    if (a > b) 
        return a
    else
        return b
}

function key(n) {
    return sprintf("%07d", n)
}
    
