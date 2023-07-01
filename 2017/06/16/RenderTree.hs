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
    drawTree 1 (fromList [25,17,23])
    flush

drawShape :: [Shape] -> IO ()
drawShape =  mapM_ drawSquare 

drawTree :: GLfloat -> Tree GLfloat -> IO ()
drawTree _ Nil = return ()
drawTree size (Branch alpha lt rt)  =
    preservingMatrix $ do
    renderPrimitive Quads $ vertex2s [(0,0),
                                      (size,0),
                                      (size,size),
                                      (0,size)]
    preservingMatrix $ do
        translate $ Vector3 0 size 0
        rotate alpha $ Vector3 0 0 1
        drawTree (size * cos (alpha*pi/180)) lt
    preservingMatrix $ do
        translate $ Vector3 size size 0
        rotate (alpha-(pi/2)) $ Vector3 0 0 1
        drawTree (size * sin (alpha*pi/180)) rt
        
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
