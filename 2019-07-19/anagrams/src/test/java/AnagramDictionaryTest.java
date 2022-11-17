import static org.assertj.core.api.Assertions.assertThat;

import java.util.Arrays;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

class AnagramDictionaryTest
{

  @Test
  void find_all_anagrams()
  {
    var theDictionary = AnagramDictionary.of("dog", "cat", "god");
    assertThat(theDictionary.allAnagramsOf("dog")).containsOnly("god");
    assertThat(theDictionary.allAnagramsOf("cat")).isEmpty();
  }

  @Test
  void a_dict_contains_words_in_lowercase_only()
  {
    var theDictionary = AnagramDictionary.of("dog", "cat", "GOD", "god");
    assertThat(theDictionary).containsOnly("god", "dog", "cat");
  }



}
