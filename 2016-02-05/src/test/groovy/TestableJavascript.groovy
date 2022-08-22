import Browser.Javascript

import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit

import static java.util.concurrent.TimeUnit.*

/**
 * Created by xadet on 2/5/16.
 */
class TestableJavascript implements Javascript {

    Browser.Javascript javascriptDelegate

    final CountDownLatch countDownLatch = new CountDownLatch(1)

    long startTime
    long callTime
    long endTime

    TestableJavascript(Javascript javascriptDelegate) {
        this.javascriptDelegate = javascriptDelegate
        this.startTime = System.currentTimeMillis()
    }

    @Override
    void run() {
        this.callTime = System.currentTimeMillis()
        this.javascriptDelegate.run()
        this.endTime = System.currentTimeMillis()
        countDownLatch.countDown()
    }

    boolean awaitExecution(){
        countDownLatch.await(1,SECONDS)
    }

    boolean hasBeenExecuted(){
        awaitExecution()
    }

    boolean hasBeenExecutedAfter(int timeout, TimeUnit unit) {
        def delayToCall = callTime - startTime
        def expectedDelay = unit.toMillis(timeout)
        return (delayToCall >= expectedDelay) && hasBeenExecuted()
    }

    boolean hasLastedLessThan(int timeout, TimeUnit unit) {
        def duration = endTime - callTime
        def expectedDuration = unit.toMillis(timeout)
        return (duration < expectedDuration) && hasBeenExecuted()
    }

    boolean hasBeenExecutedBefore(TestableJavascript otherJavascript) {
        return endTime < otherJavascript.callTime
    }
}
