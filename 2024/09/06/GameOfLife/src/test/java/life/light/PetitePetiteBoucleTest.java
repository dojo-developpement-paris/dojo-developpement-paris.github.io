package life.light;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class PetitePetiteBoucleTest {

    @Test
    void interpreteUneGrilleVide(){
         String grille = """
                ...
                ...
                ...
                """;

        assertTrue(Univers.interprete(grille).isEmpty());

    }

    @Test
    void interpreteUneGrillePasVide(){
        String grille = """
                o..
                ...
                ...
                """;
        assertFalse(Univers.interprete(grille).isEmpty());
    }
}
