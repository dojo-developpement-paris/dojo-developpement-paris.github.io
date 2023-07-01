import spock.lang.Specification

import static java.util.concurrent.TimeUnit.MILLISECONDS


class BrowserTest extends Specification {
    private Browser browser

    def setup() {
        given:
        this.browser = new Browser()
    }

    def "should run javascript code"() {
        given:
        def javascriptAction = new TestableJavascript({})
        when:
        browser.executeJavascript(javascriptAction)
        javascriptAction.awaitExecution()
        then:
        javascriptAction.hasBeenExecuted()
    }


    def "should run javascript code with a setTimeout call"() {
        given:
        def action = new TestableJavascript({})
        and:
        def callerJavascriptAction = new TestableJavascript(new Browser.Javascript() {
            @Override
            void run() {
                setTimeout(action, 100)
            }
        })
        when:
        browser.executeJavascript(callerJavascriptAction)
        action.awaitExecution()
        then:
        action.hasBeenExecutedAfter(100, MILLISECONDS)
    }

    def "should not block browser when calling a setTimeout"() {
        given:
        def action = new TestableJavascript({})
        and:
        def callerJavascriptAction = new TestableJavascript(new Browser.Javascript() {
            @Override
            void run() {
                setTimeout(action, 100)
            }
        })
        when:
        browser.executeJavascript(callerJavascriptAction)
        callerJavascriptAction.awaitExecution()
        then:
        callerJavascriptAction.hasLastedLessThan(100, MILLISECONDS)
    }

    def "setTimeout should not block other setTimeout"() {
        given:
        def action1 = new TestableJavascript({})
        def action2 = new TestableJavascript({})
        and:
        def callerJavascriptAction = new TestableJavascript(new Browser.Javascript() {
            @Override
            void run() {
                setTimeout(action1, 100)
                setTimeout(action2, 0)
            }
        })
        when:
        browser.executeJavascript(callerJavascriptAction)
        action1.awaitExecution()
        action2.awaitExecution()
        then:
        action2.hasBeenExecutedBefore(action1)
    }

    def """should act like a real browser!"""() {
        given:
        def string = "";
        def innerJavascript = new TestableJavascript({
            string += "inner";
        })
        and:
        def outerJavascript = new TestableJavascript(new Browser.Javascript() {
            @Override
            void run() {
                setTimeout(innerJavascript, 0);
                string += "outter";
            }
        })
        when:
        browser.executeJavascript(outerJavascript)
        outerJavascript.awaitExecution()
        innerJavascript.awaitExecution()
        then:
        string == "outterinner"
    }


}