-- arith3broken.hs
module Arith3Broken where

data RcdDate = Mon | Tues | Wed | Thurs | Fri | Sat | Sun deriving (Show, Eq, Ord)

missing_case :: Num p => RcdDate -> p
missing_case Mon = 1
missing_case Tues = 2
missing_case Wed = 3
missing_case Thurs = 4
missing_case Sat = 5
missing_case Sun = 6

main :: IO ()
main = do
  print $ 1 + 2
  putStrLn "10"
  print $ negate (-1)
  print ((+) 0 blah)
  where
    blah = negate 1
