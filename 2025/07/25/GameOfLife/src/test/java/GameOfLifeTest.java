import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;


public class GameOfLifeTest {

    @Nested
    public class SousPopulation {
        @Test
        public void UneCelluleIsoleMeureApresUneIteration() {
            GameOfLife gameOfLife = new GameOfLife();
            gameOfLife.addCell(1, 1);
            Assertions.assertEquals(Cell.Alive,
                    gameOfLife.getStatus(1, 1));
            gameOfLife.iterate();
            Assertions.assertEquals(Cell.Empty,
                    gameOfLife.getStatus(1, 1));
        }
    }

    @Nested
    public class Naissance {
        @Test
        @Disabled
        public void UneCelluleNaitSiElleATroisVoisins() {
            GameOfLife gameOfLife = new GameOfLife();
            gameOfLife.addCell(1, 0);
            gameOfLife.addCell(0, 0);
            gameOfLife.addCell(-1, 0);
            gameOfLife.iterate();
            Assertions.assertEquals(Cell.Alive,
                    gameOfLife.getStatus(0, 1));
        }
    }

    @Nested
    public class Survie {
        @Test
        public void UnCelluleResteVivanteSiElleADeuxVoisins() {
            GameOfLife gameOfLife = new GameOfLife();
            gameOfLife.addCell(1, 0);
            gameOfLife.addCell(0, 0);
            gameOfLife.addCell(-1, 0);
            gameOfLife.iterate();
            Assertions.assertEquals(Cell.Alive,
                    gameOfLife.getStatus(0, 0));
        }

        @Test
        public void UnCelluleResteVivanteSiElleADeuxVoisins1() {
            GameOfLife gameOfLife = new GameOfLife();
            gameOfLife.addCell(1, 1);
            gameOfLife.addCell(0, 1);
            gameOfLife.addCell(-1, 1);
            gameOfLife.iterate();
            Assertions.assertEquals(Cell.Alive,
                    gameOfLife.getStatus(0, 1));
        }
    }
}
