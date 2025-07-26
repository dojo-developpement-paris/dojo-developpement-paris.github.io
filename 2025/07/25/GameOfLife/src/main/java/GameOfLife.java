import java.util.HashSet;
import java.util.Set;

public class GameOfLife {
    Set<Coord> currentGeneration = new HashSet<>();

    public void addCell(int x, int y) {
        currentGeneration.add(new Coord(x, y));
    }

    public void iterate() {
        Set<Coord> nextGeneration = new HashSet<>();

        for (Coord coord : currentGeneration) {
            if (neighbours(coord) == 2) {
                nextGeneration.add(coord);
            }
        }
        currentGeneration = nextGeneration;
    }

    private int neighbours(Coord coord) {
        int count = 0;
        if (currentGeneration.contains(new Coord(coord.x() + 1, coord.y()))) {
            count++;
        }
        if (currentGeneration.contains(new Coord(coord.x() - 1, coord.y()))) {
            count++;
        }
        return count;
    }

    public Cell getStatus(int x, int y) {
        if (currentGeneration.contains(new Coord(x, y))) {
            return Cell.Alive;
        }
        return Cell.Empty;
    }
}

