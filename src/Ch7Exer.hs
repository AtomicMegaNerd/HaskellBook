module Ch7Exer where

f1 :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f1 (a, _b, c) (d, _e, f) = ((a, d), (c, f))

functionC :: Ord p => p -> p -> p
functionC x y = case x > y of
  True -> x
  False -> y

ifEvenAdd2 :: Integral p => p -> p
ifEvenAdd2 n = case even n of
  True -> (n + 2)
  False -> n

nums :: (Ord a, Num a, Num p) => a -> p
nums x = case compare x 0 of
  LT -> -1
  GT -> 1
  EQ -> 0

-- -> is right associative
returnLast' :: a -> (b -> (c -> (d -> d)))
returnLast' _ _ _ d = d
