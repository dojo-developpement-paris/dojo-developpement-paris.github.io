package org.example;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class GildedRoseTest {

    @Test
    void updateQuality_should_decrease_sellIn_by_one() {
        GildedRose app = buildGildedRose("foo", 1, 1);

        app.updateQuality();

        assertThat(app.items[0].sellIn).isZero();
    }

    @Test
    void updateQuality_should_decrease_quality_by_one() {
        GildedRose app = buildGildedRose("foo", 1, 1);

        app.updateQuality();

        assertThat(app.items[0].quality).isZero();
    }

    @Test
    void updateQuality_should_decrease_quality_two_times_faster_when_item_is_expired() {
        GildedRose app = buildGildedRose("foo", 0, 5);

        app.updateQuality();

        assertThat(app.items[0].quality).isEqualTo(3);
    }

    @Test
    void updateQuality_should_not_decrease_quality_when_quality_is_zero() {
        GildedRose app = buildGildedRose("foo", 2, 0);

        app.updateQuality();

        assertThat(app.items[0].quality).isZero();
    }

    private static GildedRose buildGildedRose(String name, int sellIn, int quality) {
        Item[] items = new Item[] { new Item(name, sellIn, quality) };
        return  new GildedRose(items);
    }

    /*
     X Une fois que la date de péremption est passée, la qualité se dégrade deux fois plus rapidement.
    X La qualité (quality) d'un produit ne peut jamais être négative.
    "Aged Brie" augmente sa qualité (quality) plus le temps passe.
    La qualité d'un produit n'est jamais de plus de 50.
    "Sulfuras", étant un objet légendaire, n'a pas de date de péremption et ne perd jamais en qualité (quality)
    "Backstage passes", comme le "Aged Brie", augmente sa qualité (quality) plus le temps passe (sellIn) ; La qualité augmente de 2 quand il reste 10 jours ou moins et de 3 quand il reste 5 jours ou moins, mais la qualité tombe à 0 après le concert.
     */
}