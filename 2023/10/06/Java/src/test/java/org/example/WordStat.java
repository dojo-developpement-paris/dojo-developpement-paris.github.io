package org.example;

import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.stream.Stream;

public class WordStat {


    private final String text;

    public WordStat(String text) {
        this.text = text;
    }

    public Map<String, Integer> metrics() {
        Map<String, Integer> result = new HashMap<>();
        String[] words = text.split(" ");
        for (String word : words) {
            if (result.containsKey(word)) {
                Integer count = result.get(word);
                result.put(word, count +1);
            } else {
                result.put(word, 1);
            }
        }
        return result;
    }

    public Map<String, Integer> metrics(int nbOfResults) {
        Stream<Map.Entry<String, Integer>> sorted = this.metrics().entrySet().stream().sorted((x, y) -> x.getValue() - y.getValue());
        Map.Entry<String, Integer> stringIntegerEntry = sorted.findFirst().get();
        HashMap result = new HashMap();
        result.put(stringIntegerEntry.getKey(), stringIntegerEntry.getValue());
        return result;
    }
}
