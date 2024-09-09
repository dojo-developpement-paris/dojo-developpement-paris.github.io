package life.light;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MainTest {

    @Test
    void leJeuDeLaVieMarche(){

        Univers univers1 = new Univers("""
                ...
                ooo
                ...
                """);
        Univers univers2 = new Univers("""
                .o.
                .o.
                .o.
                """);
        assertEquals(univers2, univers1.evolue());
    }


}
