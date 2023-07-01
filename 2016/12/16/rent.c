#include <stdio.h>
#include <stdlib.h>
#define LINELENGTH 80
#define MAXORDERS 20000
#define MAXPLAN 2000000

char Line[LINELENGTH];

struct order {
    int start_time;
    int duration;
    int price;
} Orders[MAXORDERS];

struct cell {
    int time;
    int value;
} Plan[MAXORDERS];

int Max_Orders = 0;

char *get_line() {
    fgets(Line, LINELENGTH, stdin);
    return Line;
}

int get_int() {
    int result;
    sscanf(get_line(), "%d", &result);
    return result;
} 

void get_orders() {
    int max_orders = get_int();
    for(int o = 0; o < max_orders; o++) {
        int p = o*2;
        get_line();
        sscanf(Line, "%d %d %d", 
                &Orders[p].start_time, 
                &Orders[p].duration, 
                &Orders[p].price);
        Orders[p+1].start_time = Orders[p].start_time 
                             + Orders[p].duration;
        Orders[p+1].duration = 0;
        Orders[p+1].price    = 0;
        Plan[p].time   = Orders[p].start_time;
        Plan[p].value   = 0;
        Plan[p+1].time = Orders[p+1].start_time;
        Plan[p+1].value = 0;
    }
    Max_Orders = max_orders * 2;
}

int max(int a, int b) {
    return a > b ? a : b;
}

int compare_orders(const void *a, const void *b) {
    struct order *oa = (struct order *)a;
    struct order *ob = (struct order *)b;
    if (oa->start_time < ob->start_time)
        return -1;
    else if (oa->start_time > ob->start_time)
        return +1;
    else
        return (oa->duration - ob->duration);
}

int compare_time(const void *a, const void *b) {
    struct cell *ca = (struct cell *)a;
    struct cell *cb = (struct cell *)b;
    return ca->time - cb->time;
}

struct cell *find(int t) {
    struct cell key;
    key.time = t;
    key.value = 0;
    return (struct cell *) bsearch(&key, Plan, Max_Orders, sizeof(struct cell), compare_time);
}

int profit() {
    qsort(Orders, Max_Orders, sizeof(struct order), compare_orders);
    qsort(Plan, Max_Orders, sizeof(struct cell), compare_time);
    int profit = 0;
    for(int o = 0; o < Max_Orders; o++) {
        int start_time = Orders[o].start_time;
        int duration   = Orders[o].duration;
        int price      = Orders[o].price;
        int end =      start_time + duration;
        if(duration > 0) {
            struct cell * c = find(end);
            c->value = max(c->value, profit + price);
        }
        else {
            struct cell * c = find(start_time);
            profit = max(profit, c->value);
        }
    }
    return profit;
}


int main() {
    int max_cases = get_int();
    for(int i = 0; i < max_cases; i++) {
        get_orders();
        printf("%d\n", profit());
    }
    return 0;
}

