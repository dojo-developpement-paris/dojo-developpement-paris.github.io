package cashregister;

public class CashRegister {
    public static Result total(Result r, Quantity quantity) {
        return r.map(price -> price.multiplyBy(quantity));
    }
}
