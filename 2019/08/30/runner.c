
#include <stdio.h>

#include "minunit.h"
#define FAIL() printf("\nfailure in %s() line %d\n", __func__, __LINE__)
#define _assert(test) do { if(!(test)) { FAIL(); return 1; } } while(0)
#define _assertequals(exp,res) do { if ((exp) != (res)) { FAIL(); printf("expected: %d but got: %d\n", exp, res); return 1; } } while(0)
#define _verify(test) do { int r=test(); tests_run++; if (r) return r; } while(0)

#define LINE_SIZE 80

int tests_run = 0;


struct order {
    int start;
    int duration;
    int amount;
};

void scan_order(struct order *o, char* line) {
    sscanf(line, "%d %d %d", 
            &o->start, 
            &o->duration,
            &o->amount);
}

void scan_orders(struct order o[], char lines[][LINE_SIZE], int size) {
    for (int i = 0; i<size; i++) {
        scan_order(&o[i], lines[i]);
    }
}

int value(struct order o[], int size) {
    int sum = 0;
    for (int i = 0; i<size; i++) {
        sum+= o[i].amount;
    }
    return sum;
}

int test_read_one_order_from_a_string() {
    char line[] = "0 5 100";
    struct order o;
    scan_order(&o, line);
    _assertequals(0, o.start);
    _assertequals(5, o.duration);
    _assertequals(100, o.amount);
    return 0;
}

int test_scan_many_orders() {
    char lines[3][LINE_SIZE] = {"0 5 100","3 7 140","5 8 90"};
    struct order orders[3];
    scan_orders(orders, lines, 3);
    _assertequals(0, orders[0].start);
    _assertequals(7, orders[1].duration);
    _assertequals(90, orders[2].amount);
    return 0;
}

int test_value_of_one_order() {
    struct order o = {0, 5, 100};
    struct order orders[] = {o};

    _assertequals(100, value(orders, 1));
    orders[0].amount = 140;
    _assertequals(140, value(orders, 1));
    return 0;
}

int test_value_of_two_order() {
    struct order orders[] = { {0, 5, 100}
                            , {5, 1, 140}
                            };
    _assertequals(240, value(orders, 2));
    return 0;
}

int all_tests() {
    _verify(test_read_one_order_from_a_string);
    _verify(test_scan_many_orders);
    _verify(test_value_of_one_order);
    _verify(test_value_of_two_order);
    return 0;
}

int main(int argc, char **argv) {
    int result = all_tests();
    if (result == 0) 
        printf("PASSED\n");
    printf("Tests run: %d\n", tests_run);
    return result != 0;
}
