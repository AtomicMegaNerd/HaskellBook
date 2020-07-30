module Main where

import           Ch4Exer

str1 = "Hello"
str2 = "pannap"
str3 = "roflfor"

main :: IO ()
main = do
    putStrLn "Hello, world"
    print $ isPalindrome str1
    print $ isPalindrome str2
    print $ isPalindrome str3
