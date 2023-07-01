package cashregister;

import java.util.Objects;

public class Quantity {
    private final double q;

    public static Quantity valueOf(double q) {
        return new Quantity(q);
    }

    private Quantity(double q) {
        this.q = q;
    }

    public double multiplyBy(double v) {
        return this.q * v;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Quantity quantity = (Quantity) o;
        return Double.compare(quantity.q, q) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(q);
    }

    @Override
    public String toString() {
        return "Quantity{" +
                "q=" + q +
                '}';
    }
}
