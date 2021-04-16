module Factorial where

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

factorial' :: Integer -> Integer
factorial' n = foldr (*) 1 [1 .. n]

factorial'' :: Integer -> Integer
factorial'' n = head $ scanr (*) 1 [1 .. n]