module Guards1 where

myAbs :: Integer -> Integer
myAbs x = if x < 0 then (- x) else x

-- This version uses guards
myAbs' :: Integer -> Integer
myAbs' x
  | x < 0 = (- x)
  | otherwise = x

bloodNa :: Integer -> String
bloodNa x
  | x < 135 = "Too low"
  | x > 145 = "Too high"
  | otherwise = "Just right"

bmi :: Integer -> String
bmi x
  | x < 19 = "Underweight"
  | x >= 19 && x < 25 = "Normal"
  | x >= 25 && x < 30 = "Overweight"
  | x >= 30 && x < 39 = "Obese"
  | otherwise = "Extremely Obese"

isRight :: (Num a, Eq a) => a -> a -> a -> String
isRight a b c
  | a ^ 2 + b ^ 2 == c ^ 2 = "RIGHT ON"
  | otherwise = "not right"

dogYears :: Integer -> Integer
dogYears x
  | x <= 0 = 0
  | x <= 1 = x * 15
  | x <= 2 = x * 12
  | x <= 4 = x * 8
  | otherwise = x * 6

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
  | y >= 0.9 = 'A'
  | y >= 0.8 = 'B'
  | y >= 0.7 = 'C'
  | y >= 0.59 = 'D'
  | y < 0.59 = 'F'
  where
    y = x / 100

pal :: Eq a => [a] -> Bool
pal xs
  | xs == reverse xs = True
  | otherwise = False

numbers :: (Ord a, Num a, Num p) => a -> p
numbers x
  | x < 0 = -1
  | x == 0 = 1
  | x > 0 = 1

f :: Int -> [Int] -> Int
f z xs = foldr (+) z xs

f' :: Int -> [Int] -> Int
f' = foldr (+)