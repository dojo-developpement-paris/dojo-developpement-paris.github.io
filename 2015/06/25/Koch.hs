import Turtle

base :: [Command]
base = [FD 800]

koch :: Command -> [Command]
koch (FD d) = [FD u, 
               TR (pi/3),   FD u, 
               TL (2*pi/3), FD u, 
               TR (pi/3), FD u]
    where u = d / 3
koch c = [c]

iter :: Monad m => m a -> Int -> (a -> m a) -> m a
iter m 0 f = m
iter m n f = (iter m (n-1) f) >>= f   

cmds = iter base 8 koch

main :: IO ()
main = do
    putStrLn "<style>svg path {fill:transparent; stroke:blue}</style>"
    putStrLn "<svg height=\"1000\" width=\"1000\">"
    putStrLn "<g transform=\"translate(00,500)\">"
    putStrLn $ trace cmds
    putStrLn "</g>"
    putStrLn "</svg>"
