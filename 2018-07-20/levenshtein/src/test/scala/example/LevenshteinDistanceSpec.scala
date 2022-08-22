package example

import org.scalatest._
import org.scalatest.prop.PropertyChecks
import org.scalatest.prop.TableDrivenPropertyChecks._

object Levensthein {

  def distance(origin: String, target: String): Int = {
    if (origin.equals("")) return target.length
    if (target.equals("")) return origin.length
    val distanceFirstChar = if (origin.charAt(0) == target.charAt(0)) 0 else 1
    val distanceSubstitution = distance(origin.substring(1), target.substring(1))
    val distanceInsertion = distance(origin.substring(1), target)
    val distanceDeletion = distance(origin, target.substring(1))
    distanceFirstChar + Seq(distanceSubstitution, distanceInsertion, distanceDeletion).min
  }
}

class LevenshteinDistanceSpec extends FunSpec with Matchers with PropertyChecks {

  describe("Levenshtein Distance") {
    it("should be 0 given two identical strings") {
      val examples = Table("value", "", "a", "aa")

      forAll(examples) { value: String =>
        Levensthein.distance(value, value) shouldEqual 0
      }
    }

    it("should be 1 given one insertion") {
      Levensthein.distance("", "a") shouldEqual 1
    }

    it("should be 1 given one deletion") {
      val examples = Table(
        ("origin", "target"),
        ("a", ""),
        ("ab", "a"))

      forAll(examples) { (origin: String, target: String) =>
        Levensthein.distance(origin, target) shouldEqual 1
      }
    }

    it("should be 1 given one substitution") {
      Levensthein.distance("a", "b") shouldEqual 1
    }

    it("should be 2 given two insertions") {
      Levensthein.distance("", "ab") shouldEqual 2
    }
    it("should be 2 given one deletion (b-cd) and one insertion (cd-e)") {
      Levensthein.distance("bcd", "cde") shouldEqual 2
    }
    it("should be 2 given one deletion (cd-e) and one insertion (b-cd)") {
      Levensthein.distance("cde", "bcd") shouldEqual 2
    }
  }
}

import org.scalacheck.Properties
import org.scalacheck.Prop.forAll

object StringSpecification extends Properties("String") {

  property("startsWith") = org.scalacheck.Prop.forAll {
    (origin: String, target: String) => {
      val distance = 6
      val i = Levensthein.distance(origin.take(distance), target.take(distance))
      val j = Levensthein.distance(target.take(distance), origin.take(distance))
      i == j
    }
  }

}
