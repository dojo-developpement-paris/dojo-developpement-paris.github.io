package com.technologyconversations.kata.marsrover;


import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

/*
Source: http://dallashackclub.com/rover

Develop an api that moves a rover around on a grid.
* You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
* - The rover receives a character array of commands.
* - Implement commands that move the rover forward/backward (f,b).
* - Implement commands that turn the rover left/right (l,r).
* - Implement wrapping from one edge of the grid to another. (planets are spheres after all)
* - Implement obstacle detection before each move to a new square.
*   If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point and reports the obstacle.
*/
public class RoverSpec {

    private Rover rover;
    private Coordinates roverCoordinates;
    private final Direction direction = Direction.NORTH;
    private Point x;
    private Point y;
    private List<Obstacle> obstacles;

    @BeforeEach
    public void beforeRoverTest() {
        x = new Point(1, 9);
        y = new Point(2, 9);
        obstacles = new ArrayList<Obstacle>();
        roverCoordinates = new Coordinates(x, y, direction, obstacles);
        rover = new Rover(roverCoordinates);
    }

    @Test
    public void newInstanceShouldSetRoverCoordinatesAndDirection() {
        assertThat(rover.getCoordinates()).isEqualToComparingFieldByField(roverCoordinates);
    }

    @Test
    public void receiveSingleCommandShouldMoveForwardWhenCommandIsF() throws Exception {
        int expected = y.getLocation() + 1;
        rover.receiveSingleCommand('F');
        assertThat(rover.getCoordinates().getY().getLocation()).isEqualTo(expected);
    }

    @Test
    public void receiveSingleCommandShouldMoveBackwardWhenCommandIsB() throws Exception {
        int expected = y.getLocation() - 1;
        rover.receiveSingleCommand('B');
        assertThat(rover.getCoordinates().getY().getLocation()).isEqualTo(expected);
    }

    @Test
    public void receiveSingleCommandShouldTurnLeftWhenCommandIsL() throws Exception {
        rover.receiveSingleCommand('L');
        assertThat(rover.getCoordinates().getDirection()).isEqualTo(Direction.WEST);
    }

    @Test
    public void receiveSingleCommandShouldTurnRightWhenCommandIsR() throws Exception {
        rover.receiveSingleCommand('R');
        assertThat(rover.getCoordinates().getDirection()).isEqualTo(Direction.EAST);
    }

    @Test
    public void receiveSingleCommandShouldIgnoreCase() throws Exception {
        rover.receiveSingleCommand('r');
        assertThat(rover.getCoordinates().getDirection()).isEqualTo(Direction.EAST);
    }

    @Test

    public void receiveSingleCommandShouldThrowExceptionWhenCommandIsUnknown() {
      Assertions.assertThatThrownBy( () -> rover.receiveSingleCommand('X')).isInstanceOf(Exception.class);
    }

    @Test
    public void receiveCommandsShouldBeAbleToReceiveMultipleCommands() throws Exception {
        int expected = x.getLocation() + 1;
        rover.receiveCommands("RFR");
        assertThat(rover.getCoordinates().getX().getLocation()).isEqualTo(expected);
        assertThat(rover.getCoordinates().getDirection()).isEqualTo(Direction.SOUTH);
    }

    @Test
    public void receiveCommandShouldWhatFromOneEdgeOfTheGridToAnother() throws Exception {
        int expected = x.getMaxLocation() + x.getLocation() - 2;
        rover.receiveCommands("LFFF");
        assertThat(rover.getCoordinates().getX().getLocation()).isEqualTo(expected);
    }

    @Test
    public void receiveCommandsShouldStopWhenObstacleIsFound() throws Exception {
        int expected = x.getLocation() + 1;
        rover.getCoordinates().setObstacles(Arrays.asList(new Obstacle(expected + 1, y.getLocation())));
        rover.getCoordinates().setDirection(Direction.EAST);
        rover.receiveCommands("FFFRF");
        assertThat(rover.getCoordinates().getX().getLocation()).isEqualTo(expected);
        assertThat(rover.getCoordinates().getDirection()).isEqualTo(Direction.EAST);
    }

    @Test
    public void positionShouldReturnXYAndDirection() throws Exception {
        rover.receiveCommands("LFFFRFF");
        assertThat(rover.getPosition()).isEqualTo("8 X 4 N");
    }

    @Test
    public void positionShouldReturnNokWhenObstacleIsFound() throws Exception {
        rover.getCoordinates().setObstacles(Arrays.asList(new Obstacle(x.getLocation() + 1, y.getLocation())));
        rover.getCoordinates().setDirection(Direction.EAST);
        rover.receiveCommands("F");
        assertThat(rover.getPosition()).endsWith(" NOK");
    }

}
