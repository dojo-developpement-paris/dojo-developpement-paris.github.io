package cashregister;

import java.util.Objects;

public class Price {
    private final double v;

    public static Price valueOf(double v) {
        return new Price(v);
    }

    private Price(double v) {
        this.v = v;
    }

    public Price multiplyBy(Quantity quantity) {
        return Price.valueOf(quantity.multiplyBy(v));
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Price price = (Price) o;
        return Double.compare(price.v, v) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(v);
    }

    @Override
    public String toString() {
        return "Price{" +
                "v=" + v +
                '}';
    }
}
