module Ch10WarmupExercises where

import Data.List

stops :: [Char]
stops = "pbtdkg"

vowels :: [Char]
vowels = "aeiou"

verbs :: [String]
verbs = ["run", "stop", "buy", "sell", "eat"]

nouns :: [String]
nouns = ["house", "pizza", "dog", "computer", "cloud"]

makeAllCombinationsXYX :: [a] -> [b] -> [c] -> [(a, b, c)]
makeAllCombinationsXYX x y z =
  [ make3Tuple x y z i j k
    | i <- [0 .. (length x - 1)],
      j <- [0 .. (length y - 1)],
      k <- [0 .. (length z - 1)]
  ]
  where
    make3Tuple :: [a] -> [b] -> [c] -> Int -> Int -> Int -> (a, b, c)
    make3Tuple x y z i j k = (x !! i, y !! j, z !! k)

makeAllCombinationsOfStopsAndVowels :: [(Char, Char, Char)]
makeAllCombinationsOfStopsAndVowels = makeAllCombinationsXYX stops vowels stops

makeAllCombinationsOfStopsAndVowelsThatStartWithP :: [(Char, Char, Char)]
makeAllCombinationsOfStopsAndVowelsThatStartWithP = makeAllCombinationsXYX "p" vowels stops

makeAllCombinationsOfNounsAndVerbs :: [(String, String, String)]
makeAllCombinationsOfNounsAndVerbs = makeAllCombinationsXYX nouns verbs nouns

secretFunc :: String -> Int
secretFunc x = div (sum (map length (words x))) (length (words x))

secretFunc' :: Fractional a => String -> a
secretFunc' x =
  fromIntegral (sum (map length (words x)))
    / fromIntegral (length (words x))

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x : xs) =
  if x == False
    then False
    else myAnd xs

myAnd' :: [Bool] -> Bool
myAnd' = foldr (&&) True

myAnd'' :: [Bool] -> Bool
myAnd'' = foldr (\x acc -> x && acc) True

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x acc -> f x || acc) False

myElem :: Eq a => a -> [a] -> Bool
myElem e = foldr (\x acc -> e == x || acc) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' e = myAny (e ==)

myReverse :: [a] -> [a]
myReverse = foldl' (flip (:)) []

rcdMap :: (a -> b) -> [a] -> [b]
rcdMap f = foldr (\x acc -> (f x) : acc) []

rcdFilter :: (a -> Bool) -> [a] -> [a]
rcdFilter f = foldr (\x acc -> if f x then x : acc else acc) []

squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\x acc -> f x ++ acc) []

squish' :: [[a]] -> [a]
squish' = squishMap id

myMaximumBy' :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy' f xs =
  foldl'
    (\x acc -> if f x acc == GT then x else acc)
    (head xs)
    xs

myMinimumBy' :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy' f xs =
  foldl'
    (\x acc -> if f x acc == LT then x else acc)
    (head xs)
    xs
