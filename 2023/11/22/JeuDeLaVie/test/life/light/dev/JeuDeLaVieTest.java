package test.life.light.dev;

import life.light.dev.Cell;
import life.light.dev.World;
import org.junit.Test;
import java.util.HashSet;
import java.util.Set;
import static org.junit.Assert.*;

public class JeuDeLaVieTest {

    // zero ou une voisine vivante = mort par solitude
    // deux voisines vivante = ne change pas d'état
    // trois voisines vivante = naissance
    // quatre et plus de voisine vivante = mort par surpopulation

    // -1,-1|-1,0|-1,1
    //  0,-1| 0,0| 0,1
    //  1,-1| 1,0| 1,1

    @Test
    public void zero_voisin(){
        Cell cell = new Cell(0,0);
        Set<Cell> cellsAlive = new HashSet<>();
        World world = new World(cellsAlive);
        assertEquals("0 voisin",world.neighbor(cell),0);
    }

    @Test
    public void un_voisin(){
        Cell cell = new Cell(0,0);
        Set<Cell> cellsAlive = new HashSet<>();
        Cell cellOne = new Cell(0,1);
        cellsAlive.add(cellOne);
        World world = new World(cellsAlive);
        assertEquals("1 voisin",world.neighbor(cell),1);
    }

    @Test
    public void deux_voisin(){
        Cell cell = new Cell(0,0);
        Set<Cell> cellsAlive = new HashSet<>();
        Cell cellOne = new Cell(0,1);
        cellsAlive.add(cellOne);
        Cell cellTwo = new Cell(1,0);
        cellsAlive.add(cellTwo);
        World world = new World(cellsAlive);
        assertEquals("2 voisins",world.neighbor(cell),2);
    }

    @Test
    public void zero_voisine_solitude(){
        Cell cell = new Cell(0,0);
        Set<Cell> cellsAlive = new HashSet<>();
        World world = new World(cellsAlive);
        assertFalse("Mort par solitude",world.isAlive(cell));
    }

    @Test
    public void un_voisine_solitude(){
        Cell cell = new Cell(0,0);
        Set<Cell> cellsAlive = new HashSet<>();
        Cell cellOne = new Cell(0,1);
        cellsAlive.add(cellOne);
        World world = new World(cellsAlive);
        assertFalse("Mort par solitude",world.isAlive(cell));
    }

    @Test
    public void deux_voisines_mort(){
        Set<Cell> cellsAlive = new HashSet<>();
        Cell cellOne = new Cell(0,1);
        cellsAlive.add(cellOne);
        Cell cellTwo = new Cell(1,0);
        cellsAlive.add(cellTwo);
        World world = new World(cellsAlive);
        Cell cell = new Cell(0,0);
        assertFalse("Reste morte",world.isAlive(cell));
    }

    @Test
    public void deux_voisines_vivante(){
        Set<Cell> cellsAlive = new HashSet<>();
        Cell cellOne = new Cell(0,1);
        cellsAlive.add(cellOne);
        Cell cellTwo = new Cell(1,0);
        cellsAlive.add(cellTwo);
        Cell cellThree = new Cell(0,0);
        cellsAlive.add(cellThree);
        World world = new World(cellsAlive);
        assertTrue("Reste vivante",world.isAlive(cellThree));
    }

    @Test
    public void trois_voisines_naissance(){
        Set<Cell> cellsAlive = new HashSet<>();
        Cell cellOne = new Cell(0,1);
        cellsAlive.add(cellOne);
        Cell cellTwo = new Cell(1,0);
        cellsAlive.add(cellTwo);
        Cell cellThree = new Cell(0,0);
        cellsAlive.add(cellThree);
        World world = new World(cellsAlive);
        Cell cell = new Cell(1,1);
        assertTrue("Naissance",world.isAlive(cell));
    }

    @Test
    public void quatre_voisines_mort(){
        Set<Cell> cellsAlive = new HashSet<>();
        Cell cellOne = new Cell(0,1);
        cellsAlive.add(cellOne);
        Cell cellTwo = new Cell(1,0);
        cellsAlive.add(cellTwo);
        Cell cellThree = new Cell(1,1);
        cellsAlive.add(cellThree);
        Cell cellFour = new Cell(-1,0);
        cellsAlive.add(cellFour);
        World world = new World(cellsAlive);
        Cell cell = new Cell(0,0);
        assertFalse("Mort pas sur population",world.isAlive(cell));
    }
}
