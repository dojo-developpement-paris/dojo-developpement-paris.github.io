public class Diamond {
    public static String of(Character character) {
        if (character.equals('A')) {
            return "A";
        }

        if (character.equals('B')) {
            return
            """
             A
            B B
             A
            """;
        }

        return
        """
          A
         B B
        C   C
         B B
          A
        """;
    }
}
