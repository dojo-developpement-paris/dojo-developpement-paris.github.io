package com.adaptionsoft.games.trivia;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import com.adaptionsoft.games.uglytrivia.Display;
import com.adaptionsoft.games.uglytrivia.Game;
import com.adaptionsoft.games.uglytrivia.Players;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class SomeTest {

	@Mock
	private Display display;

	private Players players = new Players();


	@Test
	public void create_a_player(){
		Game g = new Game(display,players);
		g.add("Chett");
		verify(display).display("Chett was added");
		verify(display).display("They are player number 1");
		verify(display,times(2)).display(any());
	}


	@Test
	public void create_two_player(){
		Game g = new Game(display,players);
		g.add("Chett");
		g.add("Georges");
		verify(display).display("Chett was added");
		verify(display).display("They are player number 1");
		verify(display).display("Georges was added");
		verify(display).display("They are player number 2");
		verify(display,times(4)).display(any());
	}

	@Test
	public void when_roll_is_one_should_display_science_category(){
		Game g = new Game(display,players);
		g.add("Chett");
		g.roll(1);
		verify(display).display("Chett was added");
		verify(display).display("They are player number 1");
		verify(display).display("Chett is the current player");
		verify(display).display("They have rolled a 1");
		verify(display).display("Chett's new location is 1");
		verify(display).display("The category is Science");
		verify(display).display("Science Question 0");

		verify(display,times(7)).display(any());

	}




}
