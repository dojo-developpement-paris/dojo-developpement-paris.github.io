package kata;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * 1. Toute cellule vivante ayant moins de deux voisines vivantes meurt, comme en cas de sous-population.
 * 2. Toute cellule vivante ayant plus de trois voisines vivantes meurt, comme en cas de surpopulation.
 * 3. Toute cellule vivante ayant deux ou trois voisines vivantes survit à la génération suivante.
 * 4. Toute cellule morte ayant exactement trois voisines vivantes redevient vivante.
 */

class GameOfLifeTest {
    @Test
    void empty_world() {
        boolean[][] world = {
                {false},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        boolean[][] newWorld = gameOfLife.next();

        assertThat(newWorld).isEqualTo(world);
    }

    @Test
    void empty_world_with_different_size() {
        boolean[][] world = {
                {false, false},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        boolean[][] newWorld = gameOfLife.next();

        assertThat(newWorld).isEqualTo(new boolean[][]{{false, false}});
    }

    @Test
    void only_one_cell_should_die() {
        boolean[][] world = {
                {true},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        boolean[][] newWorld = gameOfLife.next();

        assertThat(newWorld).isEqualTo(new boolean[][]{{false}});
    }

    @Test
    void only_one_cell_should_die_different_size() {
        boolean[][] world = {
                {true, false},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        boolean[][] newWorld = gameOfLife.next();

        assertThat(newWorld).isEqualTo(new boolean[][]{{false, false}});
    }

    @Test
    void with_two_neighbours_one_cell_lives() {
        boolean[][] world = {
                {true, true, true},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        boolean[][] newWorld = gameOfLife.next();

        assertThat(newWorld).isEqualTo(new boolean[][]{{false, true, false}});
    }

    @Test
    void with_two_neighbours_one_cell_lives_bigger() {
        boolean[][] world = {
                {true, true, true, true},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        boolean[][] newWorld = gameOfLife.next();

        assertThat(newWorld).isEqualTo(new boolean[][]{{false, true, true, false}});
    }

    @Test
    void zero_neighbours_alive() {
        boolean[][] world = {
                {false, false},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        int aliveNeighbours = gameOfLife.computeAliveNeighbours(0,0);

        assertThat(aliveNeighbours).isEqualTo(0);
    }

    @Test
    void one_neighbours_alive() {
        boolean[][] world = {
                {false, true},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        int aliveNeighbours = gameOfLife.computeAliveNeighbours(0,0);

        assertThat(aliveNeighbours).isEqualTo(1);
    }

    @Test
    void zero_neighbours_alive_toto() {
        boolean[][] world = {
                {false, true},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        int aliveNeighbours = gameOfLife.computeAliveNeighbours(0,1);

        assertThat(aliveNeighbours).isEqualTo(0);
    }

    @Test
    void one_neighbours_alive_toto() {
        boolean[][] world = {
                {true, true},
        };
        GameOfLife gameOfLife = new GameOfLife(world);

        int aliveNeighbours = gameOfLife.computeAliveNeighbours(0,1);

        assertThat(aliveNeighbours).isEqualTo(1);
    }
}