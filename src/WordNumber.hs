module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"

digits :: Int -> [Int]
digits 0 = []
digits n = (digits d) ++ [r]
  where
    d = div n 10
    r = mod n 10

-- Using parens
wordNumber :: Int -> String
wordNumber n = concat (intersperse "-" (map digitToWord (digits n)))

-- We can replace the pairs of parens with $
wordNumber' :: Int -> String
wordNumber' n = concat $ intersperse "-" $ map digitToWord $ digits n

-- This is the point free style... harder to understand right now..
wordNumber'' :: Int -> String
wordNumber'' = concat . intersperse "-" . map digitToWord . digits