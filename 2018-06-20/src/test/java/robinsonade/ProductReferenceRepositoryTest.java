package robinsonade;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class ProductReferenceRepositoryTest {

    @Test
    void add_product_reference() {

        ProductReferenceRepository productReferenceRepository = new ProductReferenceRepository();

        var productReference = new ProductReference("BANANE", new Price(5.0));
        var expectedProductReference = new ProductReference("BANANE", new Price(5.0));

        productReferenceRepository.add(productReference);

        assertThat(productReferenceRepository.getByReference("BANANE")).isEqualTo(Result.found(expectedProductReference));
    }

    @Test
    @DisplayName("Search not found product reference")
    void search_not_found_product_reference() {

        ProductReferenceRepository productReferenceRepository = new ProductReferenceRepository();

        var productReference = new ProductReference("BANANE", new Price(5.0));

        productReferenceRepository.add(productReference);

        assertThat(productReferenceRepository.getByReference("POMME")).isNotNull().isEqualTo(Result.notFound("POMME"));
    }

}
