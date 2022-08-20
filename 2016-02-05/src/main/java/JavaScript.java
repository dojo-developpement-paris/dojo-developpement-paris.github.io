import java.util.function.Consumer;
import java.util.function.Function;

public interface JavaScript extends Runnable{

    default void setTimeout(Runnable function, int timeout){
        Browser.instance.setTimeout(function, timeout);
    }

    default void getValueAndExecute(Consumer<String> function){
        Browser.instance.getValueAndExecute(function);
    }

    default Promise getValueAsPromise() {
        Promise promise = new Promise();
        getValueAndExecute(promise::fulfill);
        return promise;
    }

    class Promise {
        private Function<String, String> thenFunction;
        private Promise nextPromise;

        public Promise then(Function<String, String> function) {
            nextPromise = new Promise();
            this.thenFunction = function;
            return nextPromise;
        }

        public void fulfill(String s) {
            String apply = thenFunction.apply(s);
            if(nextPromise != null) {
                nextPromise.fulfill(apply);
            }
        }
    }
}
