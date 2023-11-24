package life.light.dev;

import java.util.*;
import java.util.function.Function;

public class World implements GenerationStrategie {

    Set<Cell> cellsAlive;
    int size;
    Map<Integer, Function<Cell, Boolean>> cellState = new HashMap<>();

    public World(Set<Cell> cellsAlive, int size) {
        this.cellsAlive = cellsAlive;
        state();
        this.size = size;
    }


    // zero ou un voisin vivant → mort par solitude
    // deux voisins vivant → ne change pas d'état
    // trois voisins vivant → naissance
    // quatre et plus de voisin vivant → mort par sur population

    public boolean isAlive(Cell cell) {
        if (neighbor(cell) == 2) {
            if (cellsAlive.contains(cell)) {
                return true;
            }
        }
        return neighbor(cell) == 3;
    }

    public void state() {
        // On ajoute le nombre de voisins et la fonction qui determine l'état de la cellule
        cellState.put(0, isDead);
        cellState.put(1, isDead);
        cellState.put(2, isSame);
        cellState.put(3, isAlive);
        cellState.put(4, isDead);
        cellState.put(5, isDead);
    }

    Function<Cell, Boolean> isAlive = cell -> true;
    Function<Cell, Boolean> isDead = cell -> false;
    Function<Cell, Boolean> isSame = this::isAlive;

    public boolean addAsAlive(Cell cell) {
        return cellState.get(neighbor(cell)).apply(cell);
    }

    // -1,-1|-1,0|-1,1
    //  0,-1| 0,0| 0,1
    //  1,-1| 1,0| 1,1

    public int neighbor(Cell cell) {
        int nbNeighbor = 0;
        for (int x = -1; x <= 1; x++) {
            for (int y = -1; y <= 1; y++) {
                if ((x != 0) || (y != 0)) {
                    Cell findCell = new Cell(cell.x + x, cell.y + y);
                    nbNeighbor = getNbNeighbor(findCell, nbNeighbor);
                }
            }
        }
        return nbNeighbor;
    }

    private int getNbNeighbor(Cell findCell, int nbNeighbor) {
        if (cellsAlive.contains(findCell)){
            return nbNeighbor+1;
        }
        return nbNeighbor;
    }

    @Override
    public World newGeneration(Function<World,World> generation) {
        return generation.apply(this);
    }

    public World oldStrategy(World world){
        Set<Cell> newCellsAlive = new HashSet<>();
        for (int x = 0; x < size; x++) {
            for (int y = 0; y < size; y++) {
                Cell cell = new Cell(x, y);
                if (isAlive(cell)) {
                    newCellsAlive.add(cell);
                }
            }
        }
        return new World(newCellsAlive, size);
    }
}
