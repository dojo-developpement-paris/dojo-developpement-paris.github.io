import life.light.Engine;

public class SpyEngine implements Engine {
    public Boolean heatIsCalled = false;

    @Override
    public void heat() {
        heatIsCalled = true;
    }
}
