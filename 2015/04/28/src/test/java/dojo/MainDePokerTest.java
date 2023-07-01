package dojo;

import org.junit.Test;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;

public class MainDePokerTest {

    @Test
    public void expect_un_deux_battu_par_un_trois() {
       assertThat(new Carte("2S").compareTo(new Carte("3H"))).isEqualTo(-1);
    }

    @Test
    public void expect_un_trois_bat_un_deux() {
        assertThat(new Carte("3S").compareTo(new Carte("2H"))).isEqualTo(1);
    }

    @Test
    public void expect_un_deux_est_equivalent_a_un_deux() {
        assertThat(new Carte("2C").compareTo(new Carte("2H"))).isEqualTo(0);
    }

    @Test
    public void expect_un_as_bat_un_deux() {
        assertThat(new Carte("1C").compareTo(new Carte("2H"))).isEqualTo(1);
    }

    @Test
    public void expect_ordre_des_cartes_par_valeur() {
        List<Carte> mains1 = Arrays.asList(
                new Carte("5H"),
                new Carte("TS"),
                new Carte("7H"),
                new Carte("6H"),
                new Carte("3H"),
                new Carte("2S"),
                new Carte("1C"),
                new Carte("4S"),
                new Carte("JH"),
                new Carte("8H"),
                new Carte("KH"),
                new Carte("QH"),
                new Carte("9C"));


        List<Carte> mains2 = Arrays.asList(
                new Carte("2S"),
                new Carte("3H"),
                new Carte("4S"),
                new Carte("5H"),
                new Carte("6H"),
                new Carte("7H"),
                new Carte("8H"),
                new Carte("9C"),
                new Carte("TS"),
                new Carte("JH"),
                new Carte("QH"),
                new Carte("KH"),
                new Carte("1C"));

        mains1.sort(Comparator.naturalOrder());
        assertThat(mains1).isEqualTo(mains2);
    }


    @Test
    public void expect_la_main_avec_la_plus_haute_carte_gagne() {
        assertThat(new Carte("2S").compareTo(new Carte("3H"))).isEqualTo(-1);
    }




    private class Carte implements Comparable <Carte> {
        private final Values value;

        public Carte(String s) {
            value = Values.getValueOf(String.valueOf(s.charAt(0)));
        }

        public int compareTo(Carte carte){

            int res = this.value.compareTo(carte.value);

            if(res < 0)
                return -1;
            if(res == 0)
                return 0;
            return 1;
        }

        public boolean equals(Object main) {
            return value.equals(((Carte) main).value);
        }


    }

    enum Values {
        Deux("2"), Trois("3"), Quatre("4"), Cinq("5"), Six("6"), Sept("7"), Huit("8"),
        Neuf("9"), Dix("T"), Jack("J"), Queen("Q"), Roi("K"), As("1");

        private String param;

        Values(String param ) {
                 this.param = param;
        }

        public static Values getValueOf(String param)  {
            return Stream.of(values()).filter(v -> v.param.equals(param)).findFirst().get();
        }






    }
}
