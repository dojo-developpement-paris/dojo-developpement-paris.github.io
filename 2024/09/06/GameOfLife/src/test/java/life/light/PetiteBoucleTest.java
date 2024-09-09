package life.light;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

public class PetiteBoucleTest {

    @Test
    void uneCelluleIsoleeMeurt(){
        Univers univers1 = new Univers("""
                ...
                .o.
                ...
                """);
        Univers univers2 = new Univers("""
                ...
                ...
                ...
                """);
        assertEquals(univers2, univers1.evolue());
    }

    @Test
    void deuxUniversDifferents(){
        Univers univers1 = new Univers("""
                ...
                .o.
                ...
                """);
        Univers univers2 = new Univers("""
                ...
                ...
                ...
                """);
        assertNotEquals(univers2, univers1);
    }

    @Test
    void quatreCellulesRestentVivantes(){
        Univers univers1 = new Univers("""
                ...
                .oo
                .oo
                """);
        assertEquals(univers1, univers1.evolue());
    }

    @Test
    void quatreAutresCellulesRestentVivantes(){
        Univers univers1 = new Univers("""
                oo.
                oo.
                ...
                """);
        assertEquals(univers1, univers1.evolue());
    }
}
