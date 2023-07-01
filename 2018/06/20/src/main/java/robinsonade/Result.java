package robinsonade;

import java.util.Objects;
import java.util.function.Function;

public abstract class Result<T> {
    public static <T> Result<T> found(T object) {
        return new Found<>(object);
    }

    public static Result notFound(String badReference) {
        return new NotFound(badReference);
    }

    abstract <R> Result<R> map(Function<T, R> f);
    private Result() {
    }

    private static class Found<T> extends Result<T> {
        private final T object;

        private Found(T object) {
            super();
            this.object = object;
        }

        @Override
        public String toString() {
            return "Found{" +
                    "object=" + object +
                    '}';
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Found found = (Found) o;
            return Objects.equals(object, found.object);
        }

        @Override
        public int hashCode() {

            return Objects.hash(object);
        }

        @Override
        <R> Result<R> map(Function<T, R> f) {
            return found(f.apply(object));
        }
    }

    private static class NotFound extends Result {
        private final String badReference;

        private NotFound(String badReference) {
            this.badReference = badReference;
        }

        @Override
        public String toString() {
            return "NotFound{" +
                    "badReference='" + badReference + '\'' +
                    '}';
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            NotFound notFound = (NotFound) o;
            return Objects.equals(badReference, notFound.badReference);
        }

        @Override
        public int hashCode() {

            return Objects.hash(badReference);
        }

        @Override
        Result map(Function f) {
            return this;
        }
    }
}
