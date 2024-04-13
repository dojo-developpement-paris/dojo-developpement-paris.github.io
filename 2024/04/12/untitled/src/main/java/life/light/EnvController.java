package life.light;

public class EnvController {
    public static final int MINIMUM_TEMPERATURE = 20;
    private Engine engine;

    public EnvController(Engine engine) {
        this.engine = engine;
    }

    public void handleTemperature(int i) {
        if (MINIMUM_TEMPERATURE > i) {
            engine.heat();
        }
    }
}
