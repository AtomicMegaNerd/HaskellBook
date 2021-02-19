module Ch9ListEnumFun where

eft :: (Eq a, Enum a) => a -> a -> [a]
eft x y
  | x == y = [y]
  | otherwise = x : eft (succ x) y

eftBool :: Bool -> Bool -> [Bool]
eftBool = eft

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> [Char]
eftChar = eft
