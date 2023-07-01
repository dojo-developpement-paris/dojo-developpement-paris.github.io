package com.adaptionsoft.games.trivia;

import com.adaptionsoft.games.uglytrivia.Players;
import org.junit.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class PlayersTest {

    @Test
    public void should_be_able_to_add_player() throws Exception {
        Players players = new Players();
        players.addPlayer("Joe");
        assertThat(players.contains("Joe")).isTrue();
    }

    @Test
    public void should_be_able_to_add_feminine_player() throws Exception {
        Players players = new Players();
        players.addPlayer("Jane");
        assertThat(players.contains("Joe")).isFalse();
    }

    @Test
    public void should_be_able_to_add_two_players() throws Exception {
        Players players = new Players();
        players.addPlayer("Joe");
        players.addPlayer("Jane");
        assertThat(players.contains("Joe")).isTrue();
        assertThat(players.contains("Jane")).isTrue();
    }

    @Test
    public void should_count_players(){
        Players players = new Players();
        players.addPlayer("Joe");
        players.addPlayer("Jane");
        assertThat(players.count()).isEqualTo(2);
    }

    @Test
    public void should_count_the_players_when_there_is_only_one(){
        Players players = new Players();
        players.addPlayer("Joe");
        assertThat(players.count()).isEqualTo(1);
    }

    @Test
    public void should_get_a_player() throws Exception {
        Players players = new Players();
        players.addPlayer("Joe");
        assertThat(players.getPlayer(0)).isEqualTo("Joe");
    }
}
