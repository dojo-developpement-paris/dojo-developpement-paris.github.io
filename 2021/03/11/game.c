#include <stdlib.h>

struct game {
    int score;
    int half_frame;
    int last_throw;
    int bonus;
    int next_bonus;
};

struct game *new_game() {
    struct game *g = (struct game *)malloc(sizeof(struct game));
    g->score = 0;
    g->half_frame = 0;
    g->last_throw = 0;
    g->bonus = 0;
    g->next_bonus = 0;
    return g;
}

int score(struct game* g) {
    return g->score;
}

void collect_bonus(struct game *g, int throw) {
    while(g->bonus) {
        g->score += throw;
        g->bonus--;
    }
    g->bonus = g->next_bonus;
    if(g->next_bonus)
        g->next_bonus--;
}

void compute_spare_bonus(struct game *g, int throw) {
    if ((g->half_frame < 20) 
      && (g->half_frame % 2) 
      && (throw + g->last_throw == 10))
        g->bonus = 1;
}

void compute_strike_bonus(struct game *g, int throw) {
    if ((g->half_frame < 20) 
       && !(g->half_frame % 2) && (throw == 10)) {
        g->bonus++;
        g->next_bonus++;
        g->half_frame++;
    }
}

void update_frame(struct game *g, int throw) {
    g->half_frame++;
    g->last_throw = throw;
}

struct game *add_throw(struct game *g, int throw){
    collect_bonus(g, throw);

    if(g->half_frame < 20)
        g->score += throw;

    compute_spare_bonus(g, throw);

    compute_strike_bonus(g, throw);

    update_frame(g, throw);
    return g;
}

int frame_number(struct game *g) {
    return 0;
}

void destroy_game(struct game *g) {
    free(g);
}
