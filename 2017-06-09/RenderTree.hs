import Graphics.UI.GLUT
import Pythtree
type Coord = (GLfloat,GLfloat)
main :: IO ()
main = do
    _ <- getArgsAndInitialize
    window <- createWindow "Pythtree"
    displayCallback $= display
    scale 0.3 0.3 (0.3 :: GLfloat)
    mainLoop 

display :: DisplayCallback
display = do
    clear [ ColorBuffer]
    drawShape $ tree 2
    flush

drawShape :: [Shape] -> IO ()
drawShape =  mapM_ drawSquare 

drawSquare :: Shape -> IO ()
drawSquare (Square s a (x,y)) = 
    preservingMatrix $ do  
        translate $ Vector3 x y 0
        rotate a $ Vector3 0 0 1
        renderPrimitive Quads $ vertex2s [(0,0),
                                          (s,0),
                                          (s,s),
                                          (0,s)]
vertex2s :: [Coord] -> IO ()
vertex2s = mapM_ vertex2

vertex2 :: Coord -> IO ()
vertex2 (x,y) = vertex $ Vertex2 x y 
