module Ch7GrabBag where

mTh :: Num a => a -> a -> a -> a
mTh x y z = x * y * z

y :: Integer -> Integer -> Integer
y = mTh 3

addOneIfOdd :: Integral p => p -> p
addOneIfOdd n = case odd n of
  True -> n + 1
  False -> n

addFive :: (Num a, Ord a) => a -> a -> a
addFive x y = (if x > y then y else x) + 5

addFive' :: Integer -> Integer -> Integer
addFive' = (\x -> \y -> (if x > y then y else x) + 5)

mflip :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
mflip f = \x -> \y -> f y x

mflip' :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
mflip' f x y = f y x