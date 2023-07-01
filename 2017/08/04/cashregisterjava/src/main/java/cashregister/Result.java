package cashregister;

import java.util.Objects;
import java.util.function.Function;

public abstract class Result {
    public static Result found(Price price) {
        return new Found(price);
    }

    public static Result notFound(String invalidCode) {
        return new NotFound(invalidCode);
    }

    public abstract Result map(Function<Price, Price> f);

    private static class Found extends Result {
        private final Price price;

        private Found(Price price) {
            super();
            this.price = price;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Found found = (Found) o;
            return Objects.equals(price, found.price);
        }

        @Override
        public int hashCode() {
            return Objects.hash(price);
        }

        @Override
        public String toString() {
            return "Found{" +
                    "price=" + price +
                    "} " + super.toString();
        }

        @Override
        public Result map(Function<Price, Price> f) {
            return Result.found(f.apply(price));
        }
    }

    private static class NotFound extends Result {
        private final String invalidCode;

        private NotFound(String invalidCode) {
            super();
            this.invalidCode = invalidCode;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            NotFound notFound = (NotFound) o;
            return Objects.equals(invalidCode, notFound.invalidCode);
        }

        @Override
        public int hashCode() {
            return Objects.hash(invalidCode);
        }

        @Override
        public String toString() {
            return "NotFound{" +
                    "invalidCode='" + invalidCode + '\'' +
                    "} " + super.toString();
        }

        @Override
        public Result map(Function<Price, Price> f) {
            return this;
        }
    }
}
