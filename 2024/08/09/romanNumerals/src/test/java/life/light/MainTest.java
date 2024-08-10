package life.light;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

class MainTest {
    @Test
    void first() {
        String result = toRoman(1);
        Assertions.assertEquals("I", result);
    }

    @Test
    void second() {
        String result = toRoman(2);
        Assertions.assertEquals("II", result);
    }

    @Test
    void third() {
        String result = toRoman(3);
        Assertions.assertEquals("III", result);
    }

    @Test
    void fourth() {
        String result = toRoman(4);
        Assertions.assertEquals("IV", result);
    }

    @Test
    void five() {
        String result = toRoman(5);
        Assertions.assertEquals("V", result);
    }

    @Test
    void six() {
        String result = toRoman(6);
        Assertions.assertEquals("VI", result);
    }

    @Test
    void nine() {
        String result = toRoman(9);
        Assertions.assertEquals("IX", result);
    }

    @Test
    void ten() {
        String result = toRoman(10);
        Assertions.assertEquals("X", result);
    }

    @Test
    void eleven() {
        String result = toRoman(11);
        Assertions.assertEquals("XI", result);
    }

    @Test
    void twelve() {
        String result = toRoman(12);
        Assertions.assertEquals("XII", result);
    }

    @Test
    void twenty() {
        String result = toRoman(20);
        Assertions.assertEquals("XX", result);
    }

    @Test
    void twenty_two() {
        String result = toRoman(22);
        Assertions.assertEquals("XXII", result);
    }

    @Test
    void forty() {
        String result = toRoman(40);
        Assertions.assertEquals("XL", result);
    }

    @Test
    void sixty() {
        String result = toRoman(60);
        Assertions.assertEquals("LX", result);
    }

    @Test
    void ninety() {
        String result = toRoman(90);
        Assertions.assertEquals("XC", result);
    }

    @Test
    void big() {
        String result = toRoman(222);
        Assertions.assertEquals("CCXXII", result);
    }

    @Test
    void verybig() {
        String result = toRoman(500);
        Assertions.assertEquals("D", result);
    }

    @Test
    void sobig() {
        String result = toRoman(1000);
        Assertions.assertEquals("M", result);
    }

    private String toRoman(int input) {
        Map<Integer, String> symbol = new HashMap<>();
        symbol.put(1, "I");
        symbol.put(5, "V");
        symbol.put(10, "X");
        symbol.put(50, "L");
        symbol.put(100, "C");
        symbol.put(500, "D");
        symbol.put(1000, "M");
        List<Integer> ranks = symbol.keySet().stream().sorted().collect(Collectors.toList());
        Integer rank;
        Integer inferiorRank;
        Integer halfRank;
        boolean half = false;
        while (!ranks.isEmpty()) {
            rank = ranks.removeLast();
            inferiorRank = rank / 10;
            if (input == rank) {
                return symbol.get(input);
            }
            if (input > rank) {
                return toRoman(rank) + toRoman(input - rank);
            }
            if (input == (rank - inferiorRank)) {
                return toRoman(inferiorRank) + toRoman(rank);
            }

            rank = ranks.removeLast();
            if (input == rank) {
                return symbol.get(input);
            }
            if (input > rank) {
                return toRoman(rank) + toRoman(input - rank);
            }
            if (input == (rank - inferiorRank)) {
                return toRoman(inferiorRank) + toRoman(rank);
            }
        }

        return "";
    }
}
