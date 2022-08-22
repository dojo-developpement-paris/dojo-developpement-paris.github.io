package fr.noether.shakok.sum;

import org.junit.Test;

import java.util.Arrays;

import static fr.noether.shakok.sum.Shadok.Alphabet.*;
import static fr.noether.shakok.sum.Shadok.Number.from;
import static org.assertj.core.api.Assertions.assertThat;

public class ShadokTest {

    @Test
    public void sum_GA_GA_is_GA() {
        checkNumberEquality(sum(GA, GA), GA);
    }

    @Test
    public void sum_GA_with_anything_is_anything() {
        checkNumberEquality(sum(GA, ZO), ZO);
    }

    @Test
    public void sum_anything_with_GA_is_anything() {
        Shadok.Number actual = sum(MEU, GA);
        checkNumberEquality(actual, MEU);
    }

    @Test
    public void sum_BU_with_ZO_is_MEU() {
        checkNumberEquality(sum(BU, ZO), MEU);
    }

    @Test
    public void sum_BU_with_BU_is_ZO() {
        checkNumberEquality(sum(BU, BU), ZO);
    }

    @Test
    public void sum_MEU_with_BU_is_BUGA() {
        checkNumberEquality(sum(MEU, BU), from(BU, GA));
    }

    @Test
    public void sum_BUGA_with_BU_is_BUBU() {
        checkNumberEquality(Shadok.sum(from(BU, GA), BU.toNumber()), from(BU, BU));
    }

    @Test
    public void sum_ZOBU_with_BU_is_ZOZO() {
        checkNumberEquality(Shadok.sum(from(ZO, BU), BU.toNumber()), from(ZO, ZO));
    }

    @Test
    public void sum_BUMEU_with_BU_is_ZOGA() {
        checkNumberEquality(Shadok.sum(from(BU, MEU), BU.toNumber()), from(ZO, GA));
    }

    @Test
    public void unit_successors() {
        checkNumberEquality(successor(GA), BU);
        checkNumberEquality(successor(BU), ZO);
        checkNumberEquality(successor(ZO), MEU);
    }

    private Shadok.Number successor(Shadok.Alphabet value) {
        return sum(value, BU);
    }

    private void checkNumberEquality(Shadok.Number actual, Shadok.Alphabet expected) {
        assertThat(actual).isEqualTo(from(expected));
    }

    private void checkNumberEquality(Shadok.Number actual, Shadok.Number expected) {
        assertThat(actual).isEqualTo(expected);
    }

    private Shadok.Number sum(Shadok.Alphabet first, Shadok.Alphabet second) {
        return Shadok.sum(first.toNumber(), second.toNumber());
    }
}