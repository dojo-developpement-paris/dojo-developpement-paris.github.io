import Calc

main = interact (unlines. map (show . calc) . lines)
