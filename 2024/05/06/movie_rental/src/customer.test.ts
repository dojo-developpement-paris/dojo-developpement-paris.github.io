import {Customer} from "./customer";
import {Rental} from "./rental";
import {Movie} from "./movie";

describe("Customer", () => {
    it("should test", () => {
        const customer = new Customer("Bob");
        customer.addRental(new Rental(new Movie("Jaws", Movie.REGULAR), 2));
        customer.addRental(new Rental(new Movie("Golden Eye", Movie.REGULAR), 3));
        customer.addRental(new Rental(new Movie("Short New", Movie.NEW_RELEASE), 1));
        customer.addRental(new Rental(new Movie("Long New", Movie.NEW_RELEASE), 2));
        customer.addRental(new Rental(new Movie("Bambi", Movie.CHILDRENS), 3));
        customer.addRental(new Rental(new Movie("Toy Story", Movie.CHILDRENS), 4));

        const expected = "" +
            "Rental Record for Bob\n" +
            "\tJaws\t2.0\n" +
            "\tGolden Eye\t3.5\n" +
            "\tShort New\t3.0\n" +
            "\tLong New\t6.0\n" +
            "\tBambi\t1.5\n" +
            "\tToy Story\t3.0\n" +
            "Amount owed is 19.0\n" +
            "You earned 7 frequent renter points";

        expect(customer.statement()).toBe(expected);
    });
});