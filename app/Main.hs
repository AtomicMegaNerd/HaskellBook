module Main where

import           Ch3Exer
import           Lib
import           Print3

main :: IO ()
main = do
    putStrLn $ exclam "Hello"
    putStrLn $ delta "Good-bye"
    putStrLn $ getLastWord "Curry is awesome!"

    print $ thirdLetter "H"
    print $ thirdLetter "Hello"

    putStrLn $ rvrs "This is the best day ever"
