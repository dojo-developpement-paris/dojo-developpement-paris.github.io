package fr.dojo;

import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class FizzBuzz {
    public static String fizzBuzz(int n) {
        String result = Stream.of(
                new Rule(3, "Fizz"),
                new Rule(5, "Buzz")
        )
                .filter(rule -> rule.applies(n))
                .map(rule -> rule.result)
                .collect(Collectors.joining());
        return Optional.of(result)
                .filter(s -> !s.isEmpty())
                .orElse(String.valueOf(n));
    }

    private static class Rule {
        private final int multiple;
        private final String result;

        private Rule(int multiple, String result) {
            this.multiple = multiple;
            this.result = result;
        }

        private boolean applies(int n) {
            return n % multiple == 0;
        }
    }
}
