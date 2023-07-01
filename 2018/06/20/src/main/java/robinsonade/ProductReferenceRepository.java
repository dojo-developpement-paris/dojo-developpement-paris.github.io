package robinsonade;

public class ProductReferenceRepository {
    private ProductReference productReference;

    public void add(ProductReference productReference) {

        this.productReference = productReference;
    }

    public Result getByReference(String reference) {
        return productReference.isMatches(reference) ? Result.found(productReference) : Result.notFound(reference);
    }
}
