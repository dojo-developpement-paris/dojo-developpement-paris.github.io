package enigma;

public class Wires {
    private final String wiring;

    public Wires(String wiring) {
        this.wiring = wiring;
    }

    public char encodeRightToLeft(char a) {
        return  wiring.charAt(0);
    }

    public char encodeLeftToRight(char letter) {
        return wiring.charAt(wiring.indexOf(letter) + 2);
    }
}
