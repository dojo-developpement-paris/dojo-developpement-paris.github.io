import java.util.concurrent.TimeUnit;

public class FakeServer {
    private JavaScript javaScript;
    private int timeout;
    private String value;

    public FakeServer(JavaScript javaScript, int timeout) {
        this.javaScript = javaScript;
        this.timeout = timeout;
    }

    public FakeServer(JavaScript javaScript, int timeout, String value) {
        this(javaScript, timeout);
        this.value = value;
    }

    public JavaScript getResource() {
        try {
            TimeUnit.MILLISECONDS.sleep(timeout);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return javaScript;
    }

    public String getValue() {
        return value;
    }
}
