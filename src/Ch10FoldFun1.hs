module Ch10FoldFun1 where

concatTake3 :: [String] -> [Char]
concatTake3 = foldr (\a b -> take 3 a ++ b) ""

concatTake3' :: [String] -> [Char]
concatTake3' = foldl (\b a -> take 3 a ++ b) ""

rcdfoldr :: (a -> b -> b) -> b -> [a] -> b
rcdfoldr f z xs = foldl (flip f) z (reverse xs)