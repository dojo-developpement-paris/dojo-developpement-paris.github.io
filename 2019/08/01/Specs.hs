import Test.Hspec
import Sudoku

miniSudoku = [
    [1, 2, 4, 3],
    [3, 4, 2, 1],
    [2, 3, 1, 4],
    [4, 1, 3, 2]]

wrongRowMiniSudoku = [
    [3, 2, 4, 3],
    [1, 4, 2, 1],
    [2, 3, 1, 4],
    [4, 1, 3, 2]]

wrongLastRowMiniSudoku = [
    [1, 2, 4, 3],
    [3, 4, 2, 1],
    [2, 1, 1, 4],
    [4, 3, 3, 2]]

wrongColMiniSudoku = [
    [2, 1, 4, 3],
    [3, 4, 2, 1],
    [2, 3, 1, 4],
    [4, 1, 3, 2]]

wrongBoxMiniSudoku = [
    [1, 2, 4, 3],
    [2, 3, 1, 4],
    [3, 4, 2, 1],
    [4, 1, 3, 2]]






main = hspec $ do
    describe "sudoku" $ do
        it "should valid miniSudoku" $ do
            isValid miniSudoku `shouldBe` True

        it "should invalidate a wrong miniSudoku" $ do
            isValid wrongRowMiniSudoku `shouldBe` False
            isValid wrongLastRowMiniSudoku `shouldBe` False
            isValid wrongColMiniSudoku `shouldBe` False
            isValid wrongBoxMiniSudoku `shouldBe` False

