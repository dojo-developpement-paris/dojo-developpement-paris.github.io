package robinsonade;

public class CashRegister {
    public Result<Price> total(Result<ProductReference> productReferenceResult, Quantity quantity) {
        return productReferenceResult
                .map(ProductReference::getPrice)
                .map(price -> price.multiplyBy(quantity));
    }
}
