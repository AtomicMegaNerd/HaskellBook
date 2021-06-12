module Ch12Exers where

import Data.Maybe (isNothing)

-- The book insists I use this helper function...
notThe :: String -> Maybe String
notThe "the" = Nothing
notThe s = Just s

-- Included the helper function above because the book said so but I do
-- not really need it.
replaceThe :: String -> String
replaceThe = unwords . replaceWithA . words
  where
    replaceWithA [] = []
    replaceWithA (x : xs)
      | isNothing (notThe x) = "a" : replaceWithA xs
      | otherwise = x : replaceWithA xs

startsWithVowel :: String -> Bool
startsWithVowel (x : xs) = x `elem` "aeiouAEIOU"
startsWithVowel _ = False

-- Maybe come back at some point and see if this can be down with a fold
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel s = doCount (words s) 0
  where
    doCount :: [String] -> Integer -> Integer
    doCount [] acc = acc
    doCount [x] acc = acc
    doCount (x : y : xs) acc =
      if x == "the" && startsWithVowel y
        then doCount xs acc + 1
        else doCount xs acc

-- Folds are so much fun :-)
countVowels :: String -> Integer
countVowels = foldr ((+) . isVowel) 0
  where
    isVowel :: Char -> Integer
    isVowel ch
      | ch `elem` "aeiouAEUIOU" = 1
      | otherwise = 0
