module Ch5Exer2 where

i :: a -> a
i x = x

c :: a -> b -> a
c x y = x

c' :: a -> b -> b
c' x y = y

r :: [a] -> [a]
r xs = xs

co :: (b -> c) -> (a -> b) -> a -> c
co f1 f2 a1 = f1 $ f2 a1

a :: (a -> c) -> a -> a
a f1 a = a

a' :: (a -> b) -> a -> b
a' f1 a = f1 a