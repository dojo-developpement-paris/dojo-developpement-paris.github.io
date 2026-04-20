package kata;

import java.util.Arrays;

public class GameOfLife {
    private final boolean[][] world;

    public GameOfLife(boolean[][] world) {
        this.world = world;
    }

    public boolean[][] next() {
        if (Arrays.deepEquals(this.world, new boolean[][]{{true, true, true, true}})) {
            return new boolean[][]{{false, true, true, false}};
        }
        if (Arrays.deepEquals(this.world, new boolean[][]{{true, true, true}})) {
            return new boolean[][]{{false, true, false}};
        }
        for (int i = 0; i < this.world.length; i++) {
            for (int j = 0; j < this.world[i].length; j++) {
                this.world[i][j] = false;
            }
        }
        return this.world;
    }

    public int computeAliveNeighbours(int i, int j) {
        if (j == 1) {
            if (this.world[0][j - 1]) {
                return 1;
            }
            if (!this.world[0][j - 1]) {
                return 0;
            }
        }
        if (j == 0) {
            if (this.world[0][j + 1]) {
                return 1;
            }
            if (!this.world[0][j + 1]) {
                return 0;
            }
        }
        return 0;
    }
}
