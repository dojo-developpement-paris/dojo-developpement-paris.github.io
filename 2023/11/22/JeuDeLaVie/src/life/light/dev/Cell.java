package life.light.dev;

import java.util.Objects;

public class Cell {
    int x;
    int y;

    public Cell(int x, int y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public boolean equals(Object cell) {
        if (cell instanceof Cell) {
            return ((Cell) cell).x == this.x && ((Cell) cell).y == this.y;
        }
        return false;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y);
    }
}
