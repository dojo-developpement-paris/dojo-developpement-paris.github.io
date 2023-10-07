package org.example;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;


class MainTest {

    @Test
    void trivialCase(){
        //ARRANGE
        Map<String, Integer> expected = new HashMap();
        expected.put("hello", 1);
        expected.put("world", 1);

        // ACT
        Map<String, Integer> wordMap = new WordStat("hello world").metrics();

        //ASSERT
        Assertions.assertThat(wordMap).containsAllEntriesOf(expected);
    }

    @Test
    void totoCase(){
        //ARRANGE
        Map<String, Integer> expected = new HashMap();
        expected.put("hello", 1);
        expected.put("toto", 1);

        // ACT
        Map<String, Integer> wordMap = new WordStat("hello toto").metrics();

        //ASSERT
        Assertions.assertThat(wordMap).containsAllEntriesOf(expected);
    }

    @Test
    void toto2Case(){
        //ARRANGE
        Map<String, Integer> expected = new HashMap();
        expected.put("hello", 2);
        expected.put("toto", 1);

        // ACT
        Map<String, Integer> wordMap = new WordStat("hello toto hello").metrics();

        //ASSERT
        Assertions.assertThat(wordMap).containsAllEntriesOf(expected);
    }

    @Test
    void toto3Case(){
        //ARRANGE
        Map<String, Integer> expectedResult = new HashMap();
        expectedResult.put("hello", 3);
        expectedResult.put("toto", 1);

        // ACT
        Map<String, Integer> wordMap = new WordStat("hello toto hello hello").metrics();

        //ASSERT
        Assertions.assertThat(wordMap).containsAllEntriesOf(expectedResult);
    }

    @Test
    void justTheWinner(){
        //ARRANGE
        Map<String, Integer> expectedResult = new HashMap();
        expectedResult.put("hello", 3);

        // ACT
        Map<String, Integer> wordMap = new WordStat("hello toto hello hello").metrics(1);

        //ASSERT
        Assertions.assertThat(wordMap).isEqualTo(expectedResult);
    }
}
