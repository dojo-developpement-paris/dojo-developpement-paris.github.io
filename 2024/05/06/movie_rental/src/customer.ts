import {Movie} from "./movie";
import {Rental} from "./rental";

export interface Customer {
    addRental(arg: Rental): void
    statement(): string
    getName(): string
}

export class ApiCustomer implements Customer {
    public getAmountOwed = (): number => 19

    private name: string;
    private rentals: Rental[] = [];

    public constructor(name: string){
        this.name = name;
    }

    public addRental(arg: Rental) {
        this.rentals.push(arg);
    }

    public getName(): string {
        return this.name;
    }

    public statement(): string {
        let totalAmount: number = 0;
        let frequentRenterPoints: number = 0;
        let result = makeHeader(this.getName());

        for (const rental of this.rentals) {
            const amount = moviePriceComputation(computationRules, rental);

            // add frequent renter points
            frequentRenterPoints += moviePriceRenterPoints(rental);

            // show figures for this rental
            result += "\t" + rental.getMovie().getTitle() + "\t" + amount.toFixed(1) + "\n";
            totalAmount += amount;
        }

        // add footer lines
        result += "Amount owed is " + totalAmount.toFixed(1) + "\n";
        result += "You earned " + frequentRenterPoints + " frequent renter points";

        return result;
    }
}

function makeHeader(customerName: string) {
    return "Rental Record for " + customerName + "\n";
}

function moviePriceRenterPoints(rental: Rental): number {
    if ((rental.getMovie().getPriceCode() === Movie.NEW_RELEASE) && rental.getDaysRented() > 1)
        return 2;
    return 1;
}

const computationRules = {
    [Movie.REGULAR]:regularMoviePriceComputation,
    [Movie.NEW_RELEASE]:newReleaseMoviePriceComputation,
    [Movie.CHILDRENS]:childrenMoviePriceComputation
}

type ComputationRules = {
    [x: number]: (rental: Rental) => number;
}

function moviePriceComputation(computationRules: ComputationRules, rental: Rental): number {
    return computationRules[rental.getMovie().getPriceCode()](rental);
}

function childrenMoviePriceComputation(rental: Rental) {
    let amount = 1.5;
    if (rental.getDaysRented() > 3) {
        amount += (rental.getDaysRented() - 3) * 1.5;
    }
    return amount;
}

function newReleaseMoviePriceComputation(rental: Rental) {
    return rental.getDaysRented() * 3;
}

function regularMoviePriceComputation(rental: Rental) {
    let amount = 2;
    if (rental.getDaysRented() > 2) {
        amount += (rental.getDaysRented() - 2) * 1.5;
    }
    return amount;
}

