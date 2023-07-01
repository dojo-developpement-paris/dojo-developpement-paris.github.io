package org.example;

import org.junit.jupiter.api.Test;
import org.example.Romain;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class RomainTest {
    @Test
    void i_egale_1() {
        assertEquals(1, Romain.enArabe("I"));
    }

    @Test
    void ii_egale_2() {
        assertEquals(2, Romain.enArabe("II"));
    }

    @Test
    void iv_egale_4() {
        assertEquals(4, Romain.enArabe("IV"));
    }

    @Test
    void v_egale_5() {
        assertEquals(5, Romain.enArabe("V"));
    }

    @Test
    void x_egal_10() {
        assertEquals(10, Romain.enArabe("X"));
    }

    @Test
    void ix_egal_9() {
        assertEquals(9, Romain.enArabe("IX"));
    }

    @Test
    void l_egal_50() {
        assertEquals(50, Romain.enArabe("L"));
    }

    @Test
    void c_egal_100() {
        assertEquals(100, Romain.enArabe("C"));
    }

    @Test
    void xcix_egal_99() {
        assertEquals(99, Romain.enArabe("XCIX"));
    }



}
