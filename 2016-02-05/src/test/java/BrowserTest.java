import org.assertj.core.api.Assertions;
import org.junit.Test;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import static org.assertj.core.api.Assertions.assertThat;

public class BrowserTest {

    @Test
    public void shouldExecuteJavascript() throws InterruptedException {
        final CountDownLatch countDownLatch = new CountDownLatch(1);
        new Browser().execute(new JavaScript() {
            public void run() {
                countDownLatch.countDown();
            }
        });
        assertJavascriptCodeIsExecuted(countDownLatch, 100);
    }

    @Test
    public void shouldHaveSetTimeoutOfJavascript() throws InterruptedException {
        final CountDownLatch countDownLatch = new CountDownLatch(1);
        new Browser().execute(new JavaScript() {
            public void run() {
                setTimeout(countDownLatch::countDown, 200);
            }
        });
        assertJavascriptCodeNotExecuted(countDownLatch, 100);
        assertJavascriptCodeIsExecuted(countDownLatch, 250);
    }

    @Test
    public void shouldBehaveAsJavascript() throws InterruptedException {
        final CountDownLatch countDownLatch = new CountDownLatch(2);
        AtomicReference<String> string = new AtomicReference<>();
        string.set("");
        new Browser().execute(new JavaScript() {
            public void run() {
                setTimeout(() -> {
                    string.accumulateAndGet("inner", (s1, s2) -> s1 + s2);
                    System.out.println(string.get());
                    countDownLatch.countDown();
                }, 0);
                string.accumulateAndGet("outer", (s1, s2) -> s1 + s2);
                System.out.println(string.get());
                countDownLatch.countDown();
            }
        });
        assertJavascriptCodeIsExecuted(countDownLatch, 50);
        assertThat(string.get()).isEqualTo("outer" + "inner");
    }

    @Test
    public void shouldGetJavascriptAndExecuteIt() throws InterruptedException {
        final CountDownLatch countDownLatch = new CountDownLatch(1);
        JavaScript javaScript = new JavaScript() {
            public void run() {
                countDownLatch.countDown();
            }
        };
        FakeServer fakeServer = new FakeServer(javaScript, 10);
        new Browser(fakeServer).getResourceAndExecute();
        assertJavascriptCodeIsExecuted(countDownLatch, 50);
    }


    @Test
    public void shouldAllowJavascriptToGetResultAndWorkOnIt() throws InterruptedException {
        final CountDownLatch countDownLatch = new CountDownLatch(2);
        AtomicReference<String> value = new AtomicReference<>();
        value.set("");
        JavaScript javaScript = new JavaScript() {
            public void run() {
                getValueAndExecute((s) -> {
                    value.set( s);
                    countDownLatch.countDown();
                });
                countDownLatch.countDown();
            }
        };
        FakeServer fakeServer = new FakeServer(javaScript, 10, "result");
        new Browser(fakeServer).getResourceAndExecute();
        assertJavascriptCodeIsExecuted(countDownLatch, 50);
        Assertions.assertThat(value.get()).isEqualTo("result");
    }




    @Test
    public void shouldAllowJavascriptPromises() throws InterruptedException {
        final CountDownLatch countDownLatch = new CountDownLatch(2);
        AtomicReference<String> value = new AtomicReference<>();
        value.set("");
        JavaScript javaScript = new JavaScript() {
            public void run() {
                getValueAsPromise()
                .then((s) -> {
                    return s + "inner";
                })
                .then((s) -> {
                    value.set(s);
                    countDownLatch.countDown();
                    return null;
                });
                countDownLatch.countDown();
            }
        };
        FakeServer fakeServer = new FakeServer(javaScript, 10, "result");
        new Browser(fakeServer).getResourceAndExecute();
        assertJavascriptCodeIsExecuted(countDownLatch, 50);
        Assertions.assertThat(value.get()).isEqualTo("resultinner");
    }



    private void assertJavascriptCodeIsExecuted(CountDownLatch countDownLatch, int timeout) throws InterruptedException {
        assertThat(countDownLatch.await(timeout, TimeUnit.MILLISECONDS)).isTrue();
    }

    private void assertJavascriptCodeNotExecuted(CountDownLatch countDownLatch, int timeout) throws InterruptedException {
        assertThat(countDownLatch.await(timeout, TimeUnit.MILLISECONDS)).isFalse();
    }

}
