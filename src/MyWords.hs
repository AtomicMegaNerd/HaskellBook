module MyWords where

import SplitBy (splitBy)

-- Haskell is just too much fun
myWords :: String -> [String]
myWords "" = []
myWords s = takeWhile (/= ' ') s : myWords (dropWhile (== ' ') $ dropWhile (/= ' ') s)

myWords' :: String -> [String]
myWords' = splitBy ' '