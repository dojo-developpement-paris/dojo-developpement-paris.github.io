import org.scalatest._

class Node(val character:Character, val nexts: List[Node] = List()){
    def isPrefixOf(word : String) = if (word.length > 1) false else
         word(0) == character 

    def matches(s: String) = s(0) == character

    def add(n: Node) = nexts
}

class Dictionary(words : List[String] = List()) {

  val roots: List[Node] = words.map(w => new Node(w(0)))

  def contains(word : String ) : Boolean = 
         roots.exists(_ isPrefixOf word) 
}

class Tests extends FlatSpec with Matchers { 

    // Dictionary specs

    "An empty dictionary" should "not contain word" in {
        val dict = new Dictionary()
        dict contains "A" should be (false) 
    }

    "A single word dictionary" should "contain this word" in {
        val dict = new Dictionary(List("A"))
        dict contains "A" should be (true)
    }

    "A dictionary with two words" should "contains these words" in {
        val dict = new Dictionary(List("A","I"))
        dict contains "A" should be (true)
        dict contains "I" should be (true)
    }
    "A dictionary with only two words" should "not contain a third word" in {
        val dict = new Dictionary(List("A","I"))
        dict contains "O" should be (false)
    }
    "A dictionary with one two letter word" should "not contain another  word starting with the same letter" in {
        val dict = new Dictionary(List("IT"))
        dict contains "IS" should be (false)
    }
    "A dictionary with one two letter word" should "contain this word" ignore {
        val dict = new Dictionary(List("IT"))
        dict contains "IT" should be (true)
    }

    // Node specs
    "A trie with one letter" should "match its letter" in {
       val trie = new Node('I')
       trie matches "I" should be (true) 
       trie matches "A" should be (false)
    }

    "A trie with two letters" should "match the two letter word" in {
        val trie = new Node('I').add(new Node('T'))
        trie matches "IT" should be (true)
        trie matches "IS" should be (false)
    }

}
