module Ch9ListCompr where

-- 1 4 9 16 25 36 49 64 81 100
mySqr :: [Integer]
mySqr = [x ^ 2 | x <- [1 .. 10]]

t1 :: [Integer]
t1 = [x | x <- mySqr, even x]

-- [(1, 64), (1, 81), (1, 100), (4, 64), (4, 81), (4, 100), ...]
t2 :: [(Integer, Integer)]
t2 = [(x, y) | x <- mySqr, x < 50, y <- mySqr, y > 50]

-- [(1, 64), (1, 81), (1, 100), (4, 64), (4, 81)
t3 :: [(Integer, Integer)]
t3 = take 5 t2

removeAllLower :: [Char] -> [Char]
removeAllLower xs = [x | x <- xs, x `elem` ['A' .. 'Z']]
