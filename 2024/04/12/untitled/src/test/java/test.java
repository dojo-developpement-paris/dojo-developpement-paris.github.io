import life.light.EnvController;
import org.junit.jupiter.api.Test;

// import org.junit.jupiter.api.BeforeEach;
// import org.junit.jupiter.params.ParameterizedTest;
// import org.junit.jupiter.params.provider.CsvSource;
// import org.junit.jupiter.params.provider.MethodSource;
// import org.junit.jupiter.params.provider.Arguments;
// import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
// import static org.junit.jupiter.api.Assertions.assertThrows;

public class test {
    @Test
    public void whenTemperature_isGood_willDoNothing() {
        SpyEngine engine = new SpyEngine();
        EnvController controller = new EnvController(engine);

        controller.handleTemperature(20);

        assertEquals(false, engine.heatIsCalled);
    }

    @Test
    public void whenTemperature_isTooCold_willHeat() {
        SpyEngine engine = new SpyEngine();
        EnvController controller = new EnvController(engine);

        controller.handleTemperature(15);

        assertEquals(true, engine.heatIsCalled);
    }
}
