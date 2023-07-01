package com.technologyconversations.kata.marsrover;

/*
Method receiveCommands should be used to transmit commands to the rover.
 */
public class Rover {

    private Coordinates coordinates;
    public void setCoordinates(Coordinates value) {
        coordinates = value;
    }
    public Coordinates getCoordinates() {
        return coordinates;
    }

    public Rover(Coordinates coordinatesValue) {
        setCoordinates(coordinatesValue);
    }

    public void receiveCommands(String commands) throws Exception {
        for (char command : commands.toCharArray()) {
            if (!receiveSingleCommand(command)) {
                break;
            }
        }
    }

    public boolean receiveSingleCommand(char command) throws Exception {
        switch(Character.toUpperCase(command)) {
            case 'F':
                return getCoordinates().moveForward();
            case 'B':
                return getCoordinates().moveBackward();
            case 'L':
                getCoordinates().changeDirectionLeft();
                return true;
            case 'R':
                getCoordinates().changeDirectionRight();
                return true;
            default:
                throw new Exception("Command " + command + " is unknown.");
        }
    }

    public String getPosition() {
        return getCoordinates().toString();
    }

}