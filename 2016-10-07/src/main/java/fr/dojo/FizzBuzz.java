package fr.dojo;

public class FizzBuzz {
    public static String fizzBuzz(int n) {
        StringBuilder result = new StringBuilder();
        if (n % 3 == 0) result.append("Fizz");
        if (n % 5 == 0) result.append("Buzz");
        if (result.length() == 0) return String.valueOf(n);
        else return result.toString();
    }
}
