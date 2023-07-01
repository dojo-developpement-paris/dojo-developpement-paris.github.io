import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class Browser {

    private static Browser browser;
    private ExecutorService threadPool = Executors.newFixedThreadPool(10);
    private ExecutorService javascriptThread = Executors.newSingleThreadExecutor();


    public Browser() {
        browser = this;
    }

    public void executeJavascript(Javascript javascript) {
        javascriptThread.submit(javascript::run);
    }


    private void setTimeout(Javascript callback, int delay) {
        threadPool.submit(() -> {
            try {
                TimeUnit.MILLISECONDS.sleep(delay);
                executeJavascript(callback);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        });
    }


    public interface Javascript extends Runnable {

        default void setTimeout(Javascript callback, int delay) {
            browser.setTimeout(callback, delay);
        }

    }

}
