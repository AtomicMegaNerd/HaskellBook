module SplitBy where

splitBy :: Eq a => a -> [a] -> [[a]]
splitBy _ [] = []
splitBy x xs = takeWhile (/= x) xs : splitBy x (dropWhile (== x) $ dropWhile (/= x) xs)