import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

class WordTest
{
  @ParameterizedTest
  @CsvSource({
                 "dog,cat"
                 , "dog,dog"
                 , "dog,DOG"})
  void not_a_anagram(String first, String second)
  {
    assertThat(Word.of(first).isAnagram(Word.of(second))).isFalse();
  }


  @ParameterizedTest
  @CsvSource({
                 "dog,god"
                 , "DOG,GOD"
                 , "BAT,TAB"
                 , "bAT,TAB"})
  void a_anagram(String first, String second)
  {
    assertThat(Word.of(first).isAnagram(Word.of(second))).isTrue();
  }


}
