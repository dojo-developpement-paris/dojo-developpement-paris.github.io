#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#define MAX_LINE 80
#define MAX_ORDERS 10000

char line[MAX_LINE];

struct order {
    int start_time;
    int duration;
    int price;
} Orders[MAX_ORDERS];

struct cash {
    int time;
    int value;
} Cash[MAX_ORDERS];

int Max_Orders;
int Max_Cash;
 

int get_int() {
    int result;
    fgets(line, MAX_LINE, stdin);
    sscanf(line, "%d", &result);
    return result;
}

void get_orders(int max) {
    Max_Orders = 0;
    for(int i=0; i < max; i++) {
        fgets(line, MAX_LINE, stdin);
        sscanf(line, "%d %d %d", &Orders[i].start_time, &Orders[i].duration, &Orders[i].price);
        assert(Orders[i].price > 0);
        Max_Orders++;
   }
}

int compare_int(const void *a, const void *b) {
    int *pa;
    int *pb;
    pa = (int *)a;
    pb = (int *)b;
    return (*pa - *pb);
}
void plan_cash() {
    int time_points[MAX_ORDERS]; 
    for(int i=0; i<Max_Orders; i++) {
        time_points[i] = Orders[i].start_time + Orders[i].duration;
    }
    qsort(time_points, Max_Orders, sizeof(int), compare_int);
    Max_Cash = 0;
    int previous = -1;
    for(int i = 0; i<Max_Orders; i++) {
        if (time_points[i] != previous) {
            Cash[Max_Cash].time = time_points[i];
            Max_Cash++;
            previous = time_points[i];
        }
    }
}
 
int compare_orders(const void *a, const void *b) {
    struct order *pa = (struct order *)a;
    struct order *pb = (struct order *)b;
    return (pa->start_time - pb->start_time);

}       
void sort_orders() {
    qsort(Orders, Max_Orders, sizeof(struct order), compare_orders);
}

void calc_profit() {
    int profit = 0;
    int current_order = 0;
    int current_cash = 0;

    while (Cash[current_cash].time <= Orders[current_order].start_time) {
        cash(Cash[current_cash]);
        current_cash++;
    }
    if(current_order < Max_Orders) {
        struct cash *cash_start = find_cash(Orders[current].start_time);
        if(cash_start != NULL) {
            if(cash_start->value > profit) 
                profit = cash_start->value;
        }
        

int process_orders(int max) {
    get_orders(max);
    assert(Max_Orders>0);
    plan_cash();
    sort_orders();
    calc_profit();
    int result = 0;
    for(int i=0; i<Max_Orders; i++) {
        result += Orders[i].price;
    }
    return result;
}
int main () {
    int max_cases = get_int();
    for(int i = 0; i < max_cases; i++) {
        int max_orders = get_int();
        int profit = process_orders(max_orders);
        printf("%d\n", profit);
    }
}
