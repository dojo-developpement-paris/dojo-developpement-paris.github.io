package MolkkyGame

data class ScoreInfo(val throws: Int, val score: Int)

class MolkkyGame(val numberOfPlayers: Int) {
    val scores: MutableList<ScoreInfo>

    init {
        require(numberOfPlayers >= 2) { "number of players must be at least 2" }
        scores = mutableListOf()
        for (i in 1..numberOfPlayers) {
            scores.add(ScoreInfo(0, 0))
        }
    }


    fun throws(vararg fallenQuills: Int) {
        scores[currentPlayer()] = ScoreInfo(1, scoreOfOneThrow(*fallenQuills))
    }

    private fun currentPlayer(): Int {
        val byThrows: java.util.Comparator<ScoreInfo> = Comparator.comparing<ScoreInfo, Int> { it.throws }
        val byScore: java.util.Comparator<ScoreInfo> = Comparator.comparing<ScoreInfo, Int> { it.score }
        val minWith: ScoreInfo? = scores.minWith(byThrows.thenComparing(byScore))
        return scores.indexOf(minWith)
    }
}

fun scoreOfOneThrow(vararg fallenQuills: Int): Int =
        if (fallenQuills.size == 1) fallenQuills.first()
        else fallenQuills.size
