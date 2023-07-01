import MolkkyGame.*
import MolkkyGame.scoreOfOneThrow
import assertk.assertions.*
import org.junit.Test
import assertk.assert
import java.lang.IllegalArgumentException

class MolkkyTest {

    @Test
    fun `molkky game should give number of players`() {
        val molkkyGame = MolkkyGame(2)
        assert(molkkyGame.numberOfPlayers)
                .isEqualTo(2)
    }

    @Test
    fun `molkky game should give scores according to number of players`() {
        val molkkyGame = MolkkyGame(2)
        assert(molkkyGame.scores).hasSize(2)
    }

    @Test
    fun `molkky game does not allow less than two players`() {
        assert {
            MolkkyGame(1)
        }.thrownError {
            isInstanceOf(IllegalArgumentException::class)
        }
    }


    @Test
    fun `molkky game should count points`() {
        assert(scoreOfOneThrow(2)).isEqualTo(2)
        assert(scoreOfOneThrow(3)).isEqualTo(3)
        assert(scoreOfOneThrow(1, 2)).isEqualTo(2)
        assert(scoreOfOneThrow(7, 8)).isEqualTo(2)
        assert(scoreOfOneThrow()).isEqualTo(0)
    }


    @Test
    fun rename() {
        val molkkyGame = MolkkyGame(2)
        molkkyGame.throws(2)
        assert(molkkyGame.scores) {
            assert(actual[0]).isEqualTo(ScoreInfo(1, 2))
            assert(actual[1]).isEqualTo(ScoreInfo(0, 0))
        }
        molkkyGame.throws(8)
        assert(molkkyGame.scores) {
            assert(actual[0]).isEqualTo(ScoreInfo(1, 2))
            assert(actual[1]).isEqualTo(ScoreInfo(1, 8))
        }
    }

}
