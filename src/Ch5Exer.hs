module Ch5Exer where

bigNum = (^) 5
wahoo = bigNum $ 10

x' = print
y' = print "woohoo world!"
z = x' "hello world"

a = (+)
b = 5
c = a 10
d = c 200


functionH :: [a] -> a
functionH (xs:_) = xs

functionC :: (Ord a) => a -> a -> Bool
functionC x y = if (x > y) then True else False

functionS :: (a, b) -> b
functionS (x, y) = y