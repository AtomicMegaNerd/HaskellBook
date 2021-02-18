module Ch8RecursiveFun where

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 incrementAmount = incrementAmount
incTimes times incrementAmount = 1 + (incTimes (times -1) incrementAmount)

applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 _func res = res
applyTimes times func res = func (applyTimes (times - 1) func res)

applyTimes' :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes' 0 _func res = res
applyTimes' times func res = func . applyTimes' (times - 1) func $ res

incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' times n = applyTimes' times (+ 1) n

type Numerator = Integer

type Denominator = Integer
type Quotient = Integer


dividedBy :: Numerator -> Denominator -> Quotient
dividedBy 0 _demnom = 0
dividedBy n d = 1 + (dividedBy (n - d) d)

dividedByWithR :: Integral a => a -> a -> (a, a)
dividedByWithR num denom = go num denom 0
  where
    go n d count
      | n < d = (count, n)
      | otherwise = go (n - d) d (count + 1)

mc91 :: (Ord p, Num p) => p -> p
mc91 x
  | x > 100 = x - 10
  | otherwise = mc91 $ mc91 $ x + 11
