package com.adaptionsoft.games.uglytrivia;

import java.util.LinkedList;

public class Game {
	private Display display;
	private Players players;
    int[] places = new int[6];
    int[] purses  = new int[6];
    boolean[] inPenaltyBox  = new boolean[6];
    
    LinkedList popQuestions = new LinkedList();
    LinkedList scienceQuestions = new LinkedList();
    LinkedList sportsQuestions = new LinkedList();
    LinkedList rockQuestions = new LinkedList();
    
    int currentPlayer = 0;
    boolean isGettingOutOfPenaltyBox;


    public  Game(Display display, Players players){

    	this.display = display;
		this.players = players;
		for (int i = 0; i < 50; i++) {
			popQuestions.addLast("Pop Question " + i);
			scienceQuestions.addLast(("Science Question " + i));
			sportsQuestions.addLast(("Sports Question " + i));
			rockQuestions.addLast(createRockQuestion(i));
    	}
    }

	public String createRockQuestion(int index){
		return "Rock Question " + index;
	}
	
	public boolean isPlayable() {
		return (players.count() >= 2);
	}

	public boolean add(String playerName) {
		
		
	    players.addPlayer(playerName);
		places[players.count()] = 0;
		purses[players.count()] = 0;
		inPenaltyBox[players.count()] = false;
	    
	    display.display(playerName + " was added");
	    display.display("They are player number " + players.count());
		return true;
	}

	public void roll(int roll) {
		display.display(players.getPlayer(currentPlayer) + " is the current player");
		display.display("They have rolled a " + roll);
		
		if (inPenaltyBox[currentPlayer]) {
			if (roll % 2 != 0) {
				isGettingOutOfPenaltyBox = true;
				
				display.display(players.getPlayer(currentPlayer) + " is getting out of the penalty box");
				places[currentPlayer] = places[currentPlayer] + roll;
				if (places[currentPlayer] > 11) places[currentPlayer] = places[currentPlayer] - 12;
				
				display.display(players.getPlayer(currentPlayer)
						+ "'s new location is " 
						+ places[currentPlayer]);
				display.display("The category is " + currentCategory());
				askQuestion();
			} else {
				display.display(players.getPlayer(currentPlayer) + " is not getting out of the penalty box");
				isGettingOutOfPenaltyBox = false;
				}
			
		} else {
		
			places[currentPlayer] = places[currentPlayer] + roll;
			if (places[currentPlayer] > 11) places[currentPlayer] = places[currentPlayer] - 12;
			
			display.display(players.getPlayer(currentPlayer)
					+ "'s new location is " 
					+ places[currentPlayer]);
			display.display("The category is " + currentCategory());
			askQuestion();
		}
		
	}

	private void askQuestion() {
		if (currentCategory() == "Pop")
			display.display(popQuestions.removeFirst());
		if (currentCategory() == "Science")
			display.display(scienceQuestions.removeFirst());
		if (currentCategory() == "Sports")
			display.display(sportsQuestions.removeFirst());
		if (currentCategory() == "Rock")
			display.display(rockQuestions.removeFirst());		
	}
	
	
	private String currentCategory() {
		if (places[currentPlayer] == 0) return "Pop";
		if (places[currentPlayer] == 4) return "Pop";
		if (places[currentPlayer] == 8) return "Pop";
		if (places[currentPlayer] == 1) return "Science";
		if (places[currentPlayer] == 5) return "Science";
		if (places[currentPlayer] == 9) return "Science";
		if (places[currentPlayer] == 2) return "Sports";
		if (places[currentPlayer] == 6) return "Sports";
		if (places[currentPlayer] == 10) return "Sports";
		return "Rock";
	}

	public boolean wasCorrectlyAnswered() {
		if (inPenaltyBox[currentPlayer]){
			if (isGettingOutOfPenaltyBox) {
				display.display("Answer was correct!!!!");
				purses[currentPlayer]++;
				display.display(players.getPlayer(currentPlayer)
						+ " now has "
						+ purses[currentPlayer]
						+ " Gold Coins.");
				
				boolean winner = didPlayerWin();
				currentPlayer++;
				if (currentPlayer == players.count()) currentPlayer = 0;
				
				return winner;
			} else {
				currentPlayer++;
				if (currentPlayer == players.count()) currentPlayer = 0;
				return true;
			}
			
			
			
		} else {
		
			display.display("Answer was corrent!!!!");
			purses[currentPlayer]++;
			display.display(players.getPlayer(currentPlayer)
					+ " now has "
					+ purses[currentPlayer]
					+ " Gold Coins.");
			
			boolean winner = didPlayerWin();
			currentPlayer++;
			if (currentPlayer == players.count()) currentPlayer = 0;
			
			return winner;
		}
	}
	
	public boolean wrongAnswer(){
		display.display("Question was incorrectly answered");
		display.display(players.getPlayer(currentPlayer)+ " was sent to the penalty box");
		inPenaltyBox[currentPlayer] = true;
		
		currentPlayer++;
		if (currentPlayer == players.count()) currentPlayer = 0;
		return true;
	}


	private boolean didPlayerWin() {
		return !(purses[currentPlayer] == 6);
	}
}
