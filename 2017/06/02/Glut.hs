import Graphics.UI.GLUT

type Coord = (GLfloat,GLfloat)

main :: IO ()
main = do
    _ <- getArgsAndInitialize
    window <- createWindow "Hello glut"
    displayCallback $= display
    mainLoop 

display :: DisplayCallback
display = do
    clear [ ColorBuffer ]
    scale' 0.5
    renderSquares 10 0.7 0 (0.5,0)
    flush

renderSquares 0 _ _ _ = return ()
renderSquares n s a (x,y) = do
    translate' x y
    scale' s
    rotateZ a
    color red
    renderPrimitive Quads $ vertex2s points
    renderSquares (n-1) (1 / sqrt 2) (pi/4) (0,1)

scale' :: GLfloat -> IO ()
scale' n = scale n n n

translate' :: GLfloat -> GLfloat -> IO ()
translate' x y = translate $ Vector3 x y 0 

rotateZ :: GLfloat -> IO ()
rotateZ a = rotate (a*180/pi) $ Vector3 0 0 1

vertex2s :: [Coord] -> IO ()
vertex2s = mapM_ vertex2

vertex2 :: Coord -> IO ()
vertex2 (x,y) = vertex $ Vertex2 x y 

red :: Color3 GLfloat
red = Color3 255 0 0

green :: Color3 GLfloat
green = Color3 0 255 0

points :: [Coord]
points = [(0,0), (0,1),(1,1),(1,0)]
