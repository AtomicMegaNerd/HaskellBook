module Ch6ChExers where

import Data.List

data Person6 = Person6 Bool deriving (Show)

printPerson :: Person6 -> IO ()
printPerson person = putStrLn (show person)

data Mood = Blah | Woot deriving (Show, Eq, Ord)

settleDown :: Mood -> Mood
settleDown x = if x == Woot then Blah else x

testMe :: Bool
testMe = Blah < Woot

type Subject = String

type Verb = String

type Object = String

data Sentence
  = Sentence Subject Verb Object
  deriving (Eq, Show)

s1 :: Sentence
s1 = Sentence "Chris" "loves" "Haskell"

data Rocks = Rocks String deriving (Eq, Show)

data Yeah = Yeah Bool deriving (Eq, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Show)

phew = Papu (Rocks "chases") (Yeah True)

-- jung :: Ord a => [a] -> a
-- jung xs = head (sort xs)

jung :: [Int] -> Int
jung xs = head (sort xs)

-- young :: [Char] -> Char
-- young xs = head (sort xs)

young :: Ord a => [a] -> a
young xs = head (sort xs)

mySort :: Ord a => [a] -> [a]
mySort = sort

signifier :: Ord a => [a] -> a
signifier xs = head (mySort xs)

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk fn a b = (fn a) == b

arith :: Num b => (a -> b) -> Integer -> a -> b
arith fn x a = (fn a)
