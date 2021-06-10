module Ch7Exer where

f1 :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f1 (a, _b, c) (d, _e, f) = ((a, d), (c, f))

functionC :: Ord p => p -> p -> p
functionC x y = if x > y then x else y

ifEvenAdd2 :: Integral p => p -> p
ifEvenAdd2 n = if even n then n + 2 else n

nums :: (Ord a, Num a, Num p) => a -> p
nums x = case compare x 0 of
  LT -> -1
  GT -> 1
  EQ -> 0

-- -> is right associative
returnLast' :: a -> (b -> (c -> (d -> d)))
returnLast' _ _ _ d = d

-- Chapter Exercises
-- ===================

-- Let's write code
-- 1.

tensDigit :: Integral a => a -> a
tensDigit x = d
  where
    xLast = x `div` 10
    d = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' x = res
  where
    res = rem (fst d) 10
    d = divMod x 10

hunsDigit :: Integral a => a -> a
hunsDigit x = res
  where
    res = rem (fst d) 10
    d = divMod x 100

-- 2.

foldBool :: a -> a -> Bool -> a
foldBool x y z = if z then y else x

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y z
  | z = x
  | not z = y

foldBool3 :: a -> a -> Bool -> a
foldBool3 x _ False = x
foldBool3 _ y True = y

-- 3.

g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)
