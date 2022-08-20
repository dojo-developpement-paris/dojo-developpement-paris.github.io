package com.adaptionsoft.games.trivia;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import com.adaptionsoft.games.uglytrivia.Display;
import com.adaptionsoft.games.uglytrivia.Game;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class SomeTest {

	@Mock
	private Display display;

	@Test
	public void notify_when_player_was_added() throws Exception {
		Game game = new Game(display);
		game.add("Chet");
		verify(display).display("Chet was added");
		verify(display).display("They are player number 1");
		verify(display, times(2)).display(any());
	}

	@Test
	public void notify_when_two_players_are_added() throws Exception {
		Game game = new Game(display);
		game.add("Chet");
		game.add("Pat");
		verify(display).display("Chet was added");
		verify(display).display("They are player number 1");
		verify(display).display("Pat was added");
		verify(display).display("They are player number 2");
		verify(display, times(4)).display(any());
	}

	@Test
	public void foobar() throws Exception {
		Game game = new Game(display);
		game.add("Chet");
		game.roll(1);
		verify(display).display("Chet was added");
		verify(display).display("They are player number 1");

		verify(display, times(7)).display(any());
	}
}
