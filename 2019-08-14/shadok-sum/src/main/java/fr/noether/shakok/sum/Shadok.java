package fr.noether.shakok.sum;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static fr.noether.shakok.sum.Shadok.Alphabet.*;

public class Shadok {

    public static class Number {
        public List<Alphabet> value = new ArrayList<>();

        private Number(Alphabet... value) {
            this.value = Arrays.asList(value);
        }

        public static Number from(Alphabet... value) {
            return new Number(value);
        }

        public Number getUnitSuccessor() {
            Alphabet first = value.get(value.size() - 1);
            if (value.size() == 2) {
                if (first == MEU) {
                    return from(value.get(0).getUnitSuccessor(), GA);
                }
                return from(value.get(0), first.getUnitSuccessor());
            }
            if (first.equals(MEU)) {
                return new Number(BU, GA);
            }
            return first.getUnitSuccessor().toNumber();
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Number number = (Number) o;
            return Objects.equals(value, number.value);
        }

        @Override
        public int hashCode() {
            return Objects.hash(value);
        }

        @Override
        public String toString() {
            return value.stream()
                    .map(Enum::name)
                    .collect(Collectors.joining());
        }
    }

    public enum Alphabet {
        GA, BU, ZO, MEU;

        Alphabet getUnitSuccessor() {
            if (this == GA) {
                return BU;
            }
            if (this == BU) {
                return ZO;
            }
            return MEU;
        }

        Number toNumber() {
            return new Number(this);
        }
    }

    public static Number sum(Number first, Number second) {
        if (first.equals(GA.toNumber())) {
            return second;
        }
        if (second.equals(BU.toNumber())) {
            return first.getUnitSuccessor();
        }
        if (second.equals(GA.toNumber())) {
            return first;
        }
        return MEU.toNumber();
    }
}
