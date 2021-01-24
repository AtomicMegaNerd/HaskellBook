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
