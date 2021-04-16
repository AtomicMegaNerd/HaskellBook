module Ch10FibFun1 where

fibs :: [Int]
fibs = 1 : scanl (+) 1 fibs

first20Fibs :: [Int]
first20Fibs = take 20 fibs

-- Is this the best way to solve that problem?
-- It works!
fibsUnder100 :: [Int]
fibsUnder100 = get100 fibs
  where
    get100 [] = []
    get100 (x : xs)
      | x > 100 = get100 []
      | otherwise = x : get100 xs

fibsN :: Int -> Int
fibsN x = fibs !! x
