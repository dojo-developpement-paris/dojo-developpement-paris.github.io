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
    flush
