package robinsonade;

import java.util.Objects;

public class ProductReference {
    private final String reference;
    private final Price price;

    public ProductReference(String reference, Price price) {
        this.reference = reference;
        this.price = price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductReference that = (ProductReference) o;
        return Objects.equals(reference, that.reference) &&
                Objects.equals(price, that.price);
    }

    @Override
    public String toString() {
        return "ProductReference{" +
                "reference='" + reference + '\'' +
                ", price=" + price +
                '}';
    }

    @Override
    public int hashCode() {

        return Objects.hash(reference, price);
    }

    public boolean isMatches(String reference) {
        return this.reference.equals(reference);
    }

    public Price getPrice() {
        return price;
    }
}
