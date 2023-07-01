struct game;

struct game *new_game();
int score(struct game* g);
struct game *add_throw(struct game *g, int throw);
int frame_number(struct game *);
void destroy_game(struct game *);
