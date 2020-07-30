module Main where

import           Ch3Exer
import           Ch4
import           Lib
import           Print3

x1 = [1, 2, 3, 4]

x2 = rcd_map (\x -> x * 2) x1

x3 = [5, 6, 7, 8]

x4 = rcd_concat x1 x3

main :: IO ()
main = do
    putStrLn $ exclam "Hello"
    putStrLn $ delta "Good-bye"
    putStrLn $ getLastWord "Curry is awesome!"

    print $ thirdLetter "H"
    print $ thirdLetter "Hello"

    putStrLn $ rvrs "This is the best day ever"

    print x2
    print x4
