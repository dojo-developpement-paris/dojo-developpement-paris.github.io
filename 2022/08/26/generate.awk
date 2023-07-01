#! /usr/bin/awk -f

# generate randow cases for rent

BEGIN {
    srand()
    print_cases(randint(1))
}

function print_cases(max) {
    printf("%d\n", max)
    for(i=0; i<max; i++) {
        print_orders(randint(10000))
    }
}

function print_orders(max) {
    printf("%d\n", max)
    for(j=0; j<max; j++) {
        start_time = randint(1000000)
        duration   = randint(1000000)
        price      = randint(10000)
        printf("%d %d %d\n",start_time, duration, price)
    }
}
    
function randint(n) {
    return 1 + int(rand() * n)
}
