module Bank
where
import System.Directory
import Control.Monad

type Amount = Int

deposit :: Amount -> IO ()
deposit amount = do
    fileExists <- doesFileExist "ACCOUNT.TXT"
    content <- if fileExists then readFile "ACCOUNT.TXT" else return ""
    let newContent = content ++ "Deposit " ++ (show amount) ++ "\n"
    writeFile "TEMP.TXT" newContent
    renameFile "TEMP.TXT" "ACCOUNT.TXT"



