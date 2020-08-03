module Ch5Exer where

functionH :: [a] -> a
functionH (x : _) = x

functionC :: (Ord a) => a -> a -> Bool
functionC x y = if (x > y) then True else False

functionS :: (a, b) -> b
functionS (x, y) = y

i :: a -> a
i x = x

c :: a -> b -> a
c x y = x

c' :: a -> b -> b
c' x y = y

r :: [a] -> [a]
r x = x

co :: (b -> c) -> (a -> b) -> a -> c
co f1 f2 a = f1 $ f2 a

a :: (a -> c) -> a -> a
a f1 a = a

a' :: (a -> b) -> a -> b
a' f1 a = f1 a
