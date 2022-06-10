import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class DiamondTest {
    @Test
    void should_return_a_diamond_shape_of_a() {
        // Arrange & Act
        String diamond = Diamond.of('A');

        // Assert
        assertThat(diamond).isEqualTo("A");
    }

    @Test
    void should_return_a_diamond_shape_of_b() {
        // Arrange & Act
        String diamond = Diamond.of('B');

        // Assert
        String expected =
        """
         A
        B B
         A
        """;
        assertThat(diamond).isEqualTo(expected);
    }

    @Test
    void should_return_a_diamond_shape_of_c() {
        // Arrange & Act
        String diamond = Diamond.of('C');

        // Assert
        String expected =
        """
          A
         B B
        C   C
         B B
          A
        """;
        assertThat(diamond).isEqualTo(expected);
    }
}
