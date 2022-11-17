package com.github

import com.github.PotterBooks.POTTER_VOL_1
import com.github.PotterBooks.POTTER_VOL_2
import io.kotlintest.specs.FreeSpec
import java.math.BigDecimal

class PotterTest : FreeSpec() {
    init {
        "In my bookshop" - {
            "a book costs 8 euros" {
                aCartContaining(POTTER_VOL_1).price shouldBe 8.euros
            }
            "the same book twice costs 16 euros" {
                aCartContaining(POTTER_VOL_1, POTTER_VOL_1).price shouldBe 16.euros
            }
            "two different books have 5% discount" {
                aCartContaining(POTTER_VOL_1, POTTER_VOL_2).price shouldBe 15.20.euros
            }
            "5% discount applies only to the package of two distinct books" {
                aCartContaining(POTTER_VOL_1, POTTER_VOL_1, POTTER_VOL_2).price shouldBe 15.20.euros + 8.euros
            }
        }
        "Euros" - {
            "should have value" {
                3.euros should { assert(it != 8.euros) }
            }
            "can be added" {
                3.euros + 5.euros shouldBe 8.euros
                3.euros + 0.05.euros shouldBe Price(BigDecimal("3.05"))
            }
        }
    }

}


private fun aCartContaining(vararg volumes: PotterBooks): Cart {
    return Cart(volumes.toList())
}

private val Int.euros: Price
    get() = Price(BigDecimal(this).setScale(2))

private val Double.euros: Price
    get() = Price(BigDecimal(this).setScale(2, BigDecimal.ROUND_HALF_EVEN))

class Cart(val volumes: Collection<PotterBooks>) {
    val price: Price
        get() {
            if (volumes.size != volumes.distinct().size) {
                return Cart(volumes.distinct()).price + Cart(volumes.remove(volumes.distinct())).price
            }

            val discount: Double = when {
                volumes.count() == 2 -> 0.95
                else -> 1.0
            }

            return (8 * volumes.count() * discount).euros
        }
}

private fun <E> Collection<E>.remove(toRemove: List<E>): Collection<E> {
    val result = this.toMutableList()
    for (element in toRemove) {
        result.remove(element)
    }
    return result
}

data class Price(val value: BigDecimal) {
    infix operator fun plus(other: Price): Price = Price(value + other.value)

}

enum class PotterBooks {
    POTTER_VOL_1,
    POTTER_VOL_2;
}