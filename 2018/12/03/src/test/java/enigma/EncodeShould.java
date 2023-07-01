package enigma;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class EncodeShould {

    @Test
    void encodeOneLetter() {
        Wires wires = new Wires("A-B");
        assertThat(wires.encodeLeftToRight('A')).isEqualTo('B');
        assertThat(wires.encodeRightToLeft('B')).isEqualTo('A');
    }

    @Test
    void triangulate() {
        Wires wires = new Wires("A-A");
        assertThat(wires.encodeLeftToRight('A')).isEqualTo('A');
        wires = new Wires("B-C");
        assertThat(wires.encodeLeftToRight('B')).isEqualTo('C');
    }
}
