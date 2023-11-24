package life.light.dev;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class Tools {

    public static Set<Cell> initWorld(int size) {
        Set<Cell> cellsAlive = new HashSet<>();
        Random rand = new Random();
        for (int i = 0; i < size*size/8; i++) {
            int x = rand.nextInt(size);
            int y = rand.nextInt(size);
            Cell cell = new Cell(x, y);
            cellsAlive.add(cell);
        }
        return cellsAlive;
    }

}
