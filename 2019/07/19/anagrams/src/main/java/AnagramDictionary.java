import static java.util.stream.Collectors.toSet;

import java.util.Iterator;
import java.util.Set;
import java.util.stream.Stream;

public class AnagramDictionary implements Iterable<String>
{
  private final Set<Word> words;


  private AnagramDictionary(Stream<Word> words)
  {
    this.words = words.map(Word::toLowerCase).collect(toSet());
  }


  public static AnagramDictionary of(String... words)
  {
    return new AnagramDictionary(Stream.of(words).map(Word::of));
  }


  @Override
  public Iterator<String> iterator()
  {
    return words.stream().map(Word::toString).iterator();
  }


  Set<String> allAnagramsOf(String word)
  {
    return words.stream().filter(w -> w.isAnagram(Word.of(word)))
                .map(Word::toString).collect(toSet());
  }

}
