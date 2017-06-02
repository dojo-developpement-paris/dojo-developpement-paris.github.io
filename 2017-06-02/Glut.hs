import Graphics.UI.GLUT

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
    rotate (45::GLfloat) $ Vector3 0 0 1
    color red
    renderPrimitive Quads $ mapM_ (\(x,y,z) -> vertex $ Vertex3 x y z) points
    flush

red :: Color3 GLfloat
red = Color3 255 0 0

points :: [(GLfloat,GLfloat,GLfloat)]
points = [(0,0,0), (0,1,0),(1,1,0),(1,0,0)]
