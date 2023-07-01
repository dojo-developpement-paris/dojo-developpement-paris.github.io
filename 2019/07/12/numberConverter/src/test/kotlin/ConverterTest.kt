package number.converter;

import org.junit.Assert
import org.junit.Test
import java.lang.Exception

class ConverterTest {
    @Test
    fun `test simple numbers`() {
        Assert.assertEquals("ZERO", convert(0))
        Assert.assertEquals("UN", convert(1))
        Assert.assertEquals("DEUX", convert(2))
        Assert.assertEquals("TROIS", convert(3))
        Assert.assertEquals("ONZE", convert(11))
    }

    @Test
    fun `test compound number`() {
        Assert.assertEquals("VINGT ET UN", convert(21))
        Assert.assertEquals("VINGT DEUX", convert(22))
        Assert.assertEquals("QUATRE-VINGT UN", convert(81))
        Assert.assertEquals("TRENTE ET UN", convert(31))
        Assert.assertEquals("CENT UN", convert(101))
        Assert.assertEquals("DIX-SEPT", convert(17))
    }

    @Test
    fun `decomposition en base 10 - 2 digits`() {
        Assert.assertArrayEquals(arrayOf(20, 5), decompose10(25))
        Assert.assertArrayEquals(arrayOf(20, 6), decompose10(26))
    }
}

fun decompose10(number: Int): Array<Int> {
    return arrayOf((number / 10) * 10, number % 10)
}

fun convert(number: Int): String {
    return when (number / 10) {
        0 -> convertSpecialDigit(number)
        1 -> convertSpecialDigit(number)
        8 -> convertDizaines(number / 10) + " " + convertSpecialDigit(number % 10)
        2 -> convertDizaines(number / 10) + liaisonPourUn(number) + convertSpecialDigit(number % 10)
        3 -> convertDizaines(number / 10) + liaisonPourUn(number) + convertSpecialDigit(number % 10)
        10 -> "CENT " + convertSpecialDigit(number % 10)
        else -> throw Exception()
    }?: ""
}

fun liaisonPourUn(number: Int): String {
    return if (number % 10 == 1) " ET " else " "
}

fun convertDizaines(number: Int) : String? {
    return when(number) {
        8 -> "QUATRE-VINGT"
        2 -> "VINGT"
        3 -> "TRENTE"
        else -> ""
    }
}

fun convertSpecialDigit(number: Int): String? {
    return when (number) {
        0 -> "ZERO"
        1 -> "UN"
        2 -> "DEUX"
        3 -> "TROIS"
        4 -> "QUATRE"
        5 -> "CINQ"
        6 -> "SIX"
        7 -> "SEPT"
        8 -> "HUIT"
        9 -> "NEUF"
        10 -> "DIX"
        11 -> "ONZE"
        12 -> "DOUZE"
        13 -> "TREIZE"
        14 -> "QUATORZE"
        15 -> "QUINZE"
        16 -> "SEIZE"
        17 -> "DIX-SEPT"
        else -> null
    }
}
