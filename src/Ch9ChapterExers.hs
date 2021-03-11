module Ch9ChapterExers where

import Data.Char (isUpper, toUpper)

rcdStrFilterIsUpper :: [Char] -> [Char]
rcdStrFilterIsUpper = filter isUpper

rcdCapFirstLetter :: [Char] -> [Char]
rcdCapFirstLetter [] = []
rcdCapFirstLetter (x : xs) = toUpper x : xs

rcdStrToUpper :: [Char] -> [Char]
rcdStrToUpper = map toUpper

rcdFirstLetterOnly :: [Char] -> Maybe Char
rcdFirstLetterOnly [] = Nothing
rcdFirstLetterOnly xs = Just (toUpper $ head xs)

-- Standard functions

myOr :: [Bool] -> Bool
myOr [] = False
myOr (True : xs) = True
myOr (_ : xs) = myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x : xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem i (x : xs) = i == x || myElem i xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' i = myAny (i ==)

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x : xs) = myReverse xs ++ [x]

squish :: [[a]] -> [a]
squish [] = []
squish (x : xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x : xs) = f x ++ squishMap f xs

squish' :: [[a]] -> [a]
squish' = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = error "This is lame"
myMaximumBy cmp (x : xs) = doMaxBy x cmp xs
  where
    doMaxBy m cmp [] = m
    doMaxBy m cmp (x : xs)
      | cmp x m == GT = doMaxBy x cmp xs
      | otherwise = doMaxBy m cmp xs

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = error "This is lame"
myMinimumBy cmp (x : xs) = doMinBy x cmp xs
  where
    doMinBy m cmp [] = m
    doMinBy m cmp (x : xs)
      | cmp x m == LT = doMinBy x cmp xs
      | otherwise = doMinBy m cmp xs

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
