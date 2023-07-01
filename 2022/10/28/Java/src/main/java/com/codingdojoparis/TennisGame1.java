package com.codingdojoparis;

public class TennisGame1 implements TennisGame {

    private int player1Points = 0;
    private int player2Points = 0;
    private String player1Name;
    private String player2Name;

    public TennisGame1(String player1Name, String player2Name) {
        this.player1Name = player1Name;
        this.player2Name = player2Name;
    }

    @Override
    public void addPointFor(String playerName) {
        if (playerName == "player1")
            player1Points += 1;
        else
            player2Points += 1;
    }

    @Override
    public String getScore() {
        if (isMatchEqual())
            return equalityScore();
        if (isMatchGameBall())
            return advantageScore();
        return nominalScore();
    }

    private String equalityScore() {
        String [] equalityScoreLabels = new String[] {"Love-All", "Fifteen-All",
                "Thirty-All", "Deuce", "Deuce"};
        return equalityScoreLabels[player1Points];
    }

    private String nominalScore() {
        return labelFor(player1Points) + "-" + labelFor(player2Points);
    }

    private static String labelFor(int points) {
        switch(points) {
            case 0:
                return "Love";
            case 1:
                return "Fifteen";
            case 2:
                return "Thirty";
            case 3:
                return "Forty";
            default:
                return "";
        }
    }

    private String advantageScore() {
        int gap = player1Points - player2Points;
        String advantagedPlayer = (gap >= 0) ? "player1" : "player2";
        String situation = Math.abs(gap) > 1 ? "Win for" : "Advantage";
        return situation + " " + advantagedPlayer;
    }

    private boolean isMatchGameBall() {
        return player1Points >= 4 || player2Points >= 4;
    }

    private boolean isMatchEqual() {
        return player1Points == player2Points;
    }
}
