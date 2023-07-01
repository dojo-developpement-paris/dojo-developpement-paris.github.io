import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;

import static java.util.concurrent.Executors.newFixedThreadPool;
import static java.util.concurrent.Executors.newSingleThreadExecutor;

public class Browser {
    public static Browser instance;

    private static final ExecutorService javascriptThread = newSingleThreadExecutor();
    private static final ExecutorService browserThreads = newFixedThreadPool(10);
    private FakeServer fakeServer;

    public Browser() {
        instance = this;
    }

    public Browser(FakeServer fakeServer) {
        this();
        this.fakeServer = fakeServer;
    }

    public void execute(JavaScript javaScript) {
        javascriptThread.submit(javaScript::run);
    }

    public void setTimeout(Runnable function, int timeout) {
        browserThreads.submit(() -> {
            try {
                TimeUnit.MILLISECONDS.sleep(timeout);
                javascriptThread.submit(function::run);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });

    }

    public void getResourceAndExecute() {
        browserThreads.submit(() -> {
            JavaScript resource = fakeServer.getResource();
            this.execute(resource);
        });
    }

    public void getValueAndExecute(Consumer<String> function) {
        browserThreads.submit(() -> {
            String value = fakeServer.getValue();
            javascriptThread.submit(() -> function.accept(value));
        });
    }
}
