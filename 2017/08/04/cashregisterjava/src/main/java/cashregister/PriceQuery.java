package cashregister;

import java.util.Objects;
import java.util.stream.Stream;

public class PriceQuery {
    private final Reference[] references;

    public PriceQuery(Reference ... references) {
        this.references = references;
    }

    public Result findPrice(String code) {
        return Stream.of(references)
                .filter(reference -> Objects.equals(reference.getCode(), code))
                .map(Reference::getPrice)
                .map(Result::found)
                .findFirst().orElseGet(() -> Result.notFound(code));
    }
}
