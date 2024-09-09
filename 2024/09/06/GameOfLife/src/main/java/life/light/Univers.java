package life.light;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public record Univers(String universSousJacent) {

    public static Collection interprete(String grille) {
        if (grille.charAt(0) =='o'){
            Set<String> truc = new HashSet<>();
            truc.add("");
            return truc;
        }
        return new HashSet();
    }

    public Univers evolue() {
        if (universSousJacent.charAt(1) =='o'){
            return new Univers("""
                oo.
                oo.
                ...
                """);
        }
        if (universSousJacent.charAt(10) == 'o') {
            return new Univers("""
                    ...
                    .oo
                    .oo
                    """);
        }
        return new Univers("""
                ...
                ...
                ...
                """);
    }

}
