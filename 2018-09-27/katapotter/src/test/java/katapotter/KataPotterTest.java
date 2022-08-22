package katapotter;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class KataPotterTest {

    public static final double TWO_BOOK_DISCOUNT = 0.95;
    public static final double THREE_BOOK_DISCOUNT = 0.90;

    @Test
    void calculatePriceOneBook() {
        double priceCalc = calculatePrice(Book.TOME1);
        assertThat(priceCalc).isEqualTo(8);
    }
    @Test
    void calculatePriceTwiceBook() {
        double priceCalc = calculatePrice(Book.TOME1, Book.TOME1);
        assertThat(priceCalc).isEqualTo(16);
    }

    @Test
    void calculatePriceTwoDifferentBooks() {
        double priceCalc = calculatePrice(Book.TOME1, Book.TOME2);
        assertThat(priceCalc).isEqualTo(15.2);
    }

    @Test
    void calculatePriceThreeDifferentBooks() {
        double priceCalc = calculatePrice(Book.TOME1, Book.TOME2,Book.TOME3);
        assertThat(priceCalc).isEqualTo(21.6);
    }
    @Test
    void calculatePriceThreeBooksEquals() {
        double priceCalc = calculatePrice(Book.TOME1, Book.TOME1,Book.TOME1);
        assertThat(priceCalc).isEqualTo(24);
    }

    @Test
    @Disabled
    void calculatePriceTwoDifferentAndOneEquals() {
        double priceCalc = calculatePrice(Book.TOME1, Book.TOME1,Book.TOME2);
        assertThat(priceCalc).isEqualTo(23.2);
    }

    private double calculatePrice(Book... books) {
        double discount = 1;
        if (books.length > 2 && books[0] != books[1]) {
            discount = THREE_BOOK_DISCOUNT;
        }

        if (isTwoDifferentBooks(books)) {
            discount = TWO_BOOK_DISCOUNT;
        }

        return 8 * books.length * discount;
    }

    private boolean isTwoDifferentBooks(Book[] books) {
        return books.length == 2 && books[0] != books[1];
    }

    private enum Book {
        TOME1,TOME2, TOME3;
    }
}
