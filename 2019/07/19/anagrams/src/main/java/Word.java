import java.util.Arrays;

public class Word
{
  private final String value;


  private Word(String value)
  {

    this.value = value;
  }


  public static Word of(String value)
  {
    return new Word(value);
  }


  public boolean isAnagram(Word otherWord)
  {
    return !value.equalsIgnoreCase(otherWord.value) && Arrays
        .equals(toSortedArray(value),
                toSortedArray(otherWord.value));
  }


  @Override
  public String toString()
  {
    return value;
  }


  private static int[] toSortedArray(String second)
  {
    return second.toLowerCase().chars().sorted().toArray();
  }


  public static Word toLowerCase(Word word)
  {
    return Word.of(word.value.toLowerCase());
  }
}
