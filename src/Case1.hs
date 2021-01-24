module Case1 where

funcZ :: (Eq a, Num a) => a -> [Char]
funcZ x = case x + 1 == 1 of
  True -> "AWESOME"
  False -> "whut?"

isPalindrome :: Eq a => [a] -> [Char]
isPalindrome xs = case xs == reverse xs of
  True -> "yes"
  False -> "no"

isPalindrome' :: Eq a => [a] -> [Char]
isPalindrome' xs = case y of
  True -> "yes"
  False -> "no"
  where
    y = xs == reverse xs