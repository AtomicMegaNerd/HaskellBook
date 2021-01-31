module Ch8Exers where

cattyConny :: String -> String -> String
cattyConny x y = x ++ "mrow" ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

rcdAddSums :: (Eq a, Num a) => a -> a
rcdAddSums 1 = 1
rcdAddSums n = n + rcdAddSums (n - 1)

rcdSumMult :: (Integral a) => a -> a -> a
rcdSumMult x y
  | y == 0 = 0
  | otherwise = x + rcdSumMult x (y - 1)

data DividedResult = Result (Integer, Integer) | DividedByZero deriving (Show)

-- How ro I make the first Integer in the result negative....
dividedBy :: Integer -> Integer -> DividedResult
dividedBy _ 0 = DividedByZero
dividedBy num denom
  | num < 0 && denom < 0 = go (abs num) (abs denom) 0
  | num < 0 && denom > 0 = goNeg (abs num) (abs denom) 0
  | num > 0 && denom < 0 = goNeg (abs num) (abs denom) 0
  | otherwise = go num denom 0
  where
    go n d count
      | n < d = Result (count, n)
      | otherwise = go (n - d) d (count + 1)
    goNeg n d count
      | n < d = Result (negate count, n)
      | otherwise = goNeg (n - d) d (count + 1)