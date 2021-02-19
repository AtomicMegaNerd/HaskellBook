{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

example = 1

x1 = (* 9) 6

-- (Num a) => (a, [Char])
x2 = head [(0, "doge"), (1, "kitteh")]

-- (Integer, [Char])
x3 = head [(0 :: Integer, "doge"), (1, "kitteh")]

-- Bool
x4 = False

x5 = length [1, 2, 3, 4, 5]

x6 :: Bool
x6 = length [1, 2, 3, 4] > length "TACOCAT"

x = 5

y = x + 5

w = y * 10

x' = 5

y' = x' + 5

z y' = y' * 10

x'' = 5

y'' = x'' + 5

f'' = 4 / y

xa = "Julie"

ya = " <3 "

za = "Haskell"

fa = xa ++ ya ++ za
