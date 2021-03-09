module Ch9FinalExers where

import Data.Char (toLower)

-- Yay eta reduction
itIsMystery :: [Char] -> [Bool]
itIsMystery = map (`elem` "aeiou")

divByThree :: Int
divByThree = length $ filter (\x -> x `mod` 3 == 0) [1 .. 30]

-- This is why I love Haskell
removeArticles :: [Char] -> [[Char]]
removeArticles = filter (notArticle . lowercase) . words
  where
    lowercase = map toLower
    notArticle a = a /= "a" && a /= "an" && a /= "the"