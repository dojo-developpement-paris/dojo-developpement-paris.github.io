package life.light.dev;

import java.util.function.Function;

public interface GenerationStrategie {
    World newGeneration(Function<World,World> generation);
}
