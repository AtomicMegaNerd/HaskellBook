module Ch7Exer1 where

k :: (a, b) -> a
k (x, y) = x

k1 :: Integer
k1 = k (4 -1, 10)

k2 :: [Char]
k2 = k ("three", (1 + 2))

k3 :: Integer
k3 = k (3, True)

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))

-- Demonstration of case expressions
pal :: Eq a => [a] -> [Char]
pal xs =
  case xs == reverse xs of
    True -> "yes"
    False -> "no"

pal' :: Eq a => [a] -> [Char]
pal' xs =
  case y of
    True -> "yes"
    False -> "no"
  where
    y = xs == reverse xs
