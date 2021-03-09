module Ch9ListCompExer1 where

mySqr :: [Integer]
mySqr = [x ^ 2 | x <- [1 .. 5]]

myCube :: [Integer]
myCube = [y ^ 3 | y <- [1 .. 5]]
