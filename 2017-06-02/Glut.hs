import Graphics.UI.GLUT

type Coord = (GLfloat,GLfloat,GLfloat)

main :: IO ()
main = do
    _ <- getArgsAndInitialize
    window <- createWindow "Hello glut"
    displayCallback $= display
    mainLoop 

display :: DisplayCallback
display = do
    clear [ ColorBuffer ]
    scale 0.7 0.7 (0.7::GLfloat)
    rotateZ (pi/4)
    color red
    renderPrimitive Quads $ vertex3s points
    flush

rotateZ :: GLfloat -> IO ()
rotateZ a = rotate (a*180/pi) $ Vector3 0 0 1

vertex3s :: [Coord] -> IO ()
vertex3s = mapM_ vertex3

vertex3 :: Coord -> IO ()
vertex3 (x,y,z) = vertex $ Vertex3 x y z

red :: Color3 GLfloat
red = Color3 255 0 0

points :: [Coord]
points = [(0,0,0), (0,1,0),(1,1,0),(1,0,0)]
