package dojo

import assertk.assert
import assertk.assertions.isEqualTo
import org.junit.Test

fun convert(n: Int): String {
    val symbols = listOf(
            1000 to "M",
            500 to "D",
            100 to "C",
            50 to "L",
            10 to "X",
            5 to "V",
            1 to "I"
    )
    val exceptions = listOf(
            900 to "CM",
            400 to "CD",
            90 to "XC",
            40 to "XL",
            9 to "IX",
            4 to "IV"
    )

    val sorted = symbols.plus(exceptions).sortedByDescending { it.first }

    return sorted.fold(symbols.last().second.repeat(n)) { acc, (x, s) ->
        acc.replace(symbols.last().second.repeat(x), s)
    }
}

class ConverterTest {

    @Test
    fun `given an integer return a roman number`() {
        listOf(
                1 to "I",
                2 to "II",
                1000 to "M",
                1001 to "MI",
                500 to "D",
                5 to "V",
                100 to "C",
                3000 to "MMM",
                400 to "CD",
                50 to "L",
                10 to "X",
                4 to "IV",
                9 to "IX",
                3999 to "MMMCMXCIX"
        ).map { (k, v) ->

            assert(convert(k)).isEqualTo(v)
        }
    }
}
