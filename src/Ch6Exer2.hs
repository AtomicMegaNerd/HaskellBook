module Ch6Exer2 where

import Data.List (sort)

data Person = Person Bool deriving (Show)

printPerson :: Person -> IO ()
printPerson person = putStrLn $ show person

data Mood = Blah | Woot deriving (Show)

instance Eq Mood where
  (==) Blah Blah = True
  (==) Woot Woot = True
  (==) _ _ = False

instance Ord Mood where
  compare Blah Woot = GT
  compare Woot Blah = LT

settleDown :: Mood -> Mood
settleDown x = if x == Woot then Blah else x

roflCompare' :: Mood -> Mood -> Bool
roflCompare' x y = x < y

type Subject = String

type Verb = String
type Object = String


data Sentence = Sentence Subject Verb Object deriving (Eq, Show)

s1 :: Object -> Sentence
s1 = Sentence "dogs" "drool"

s2 :: Sentence
s2 = Sentence "Julie" "loves" "dogs"

data Rocks = Rocks String deriving (Eq, Show)

data Yeah = Yeah Bool deriving (Eq, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Show)

truth :: Papu
truth = Papu (Rocks "chomskydoz") (Yeah True)

equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

i :: Num a => a
i = 1

f :: RealFrac a => a
f = 1.0

myX = 1 :: Int

jung :: [Int] -> Int
jung xs = head (sort xs)

young :: Ord a => [a] -> a
young xs = head (sort xs)

mySort :: Ord a => [a] -> [a]
mySort = sort

signifier :: Ord a => [a] -> a
signifier xs = head (mySort xs)

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f1 a b = (f1 a) == b

mTh :: Num a => a -> a -> a -> a
mTh x y z = x * y * z

mTh' :: Num a => a -> a -> a -> a
mTh' x y = \z -> x * y * z

mTh'' :: Num a => a -> a -> a -> a
mTh'' x = \y -> \z -> x * y * z

mTh''' :: Num a => a -> a -> a -> a
mTh''' = \x -> \y -> \z -> x * y * z

d :: Integer -> Integer -> Integer
d = mTh 3

addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where
    f = (\n -> n + 1)

addFive = \x -> \y -> (if x > y then y else x) + 5

mflip f x y = f y x