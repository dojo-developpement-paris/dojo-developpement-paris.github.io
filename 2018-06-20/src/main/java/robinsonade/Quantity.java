package robinsonade;

public class Quantity {
    private final int value;

    public Quantity(int value) {
        this.value = value;
    }

    public double multiplyBy(double value) {
        return this.value * value;
    }
}
