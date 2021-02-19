module PoemLines where

import SplitBy (splitBy)

firstSen :: String
firstSen = "Tyger Tyger, burning bright\n"

secondSen :: String
secondSen = "In the forests of the night\n"

thirdSen :: String
thirdSen = "What immortal hand or eye\n"

fourthSen :: String
fourthSen =
  "Could frame thy fearful\
  \ symmetry?"

sentences :: String
sentences =
  firstSen ++ secondSen
    ++ thirdSen
    ++ fourthSen

-- This is the same as myWords in the MyWords module, just with '\n' instead of
-- ' '
myLines :: String -> [String]
myLines "" = []
myLines s = takeWhile (/= '\n') s : myLines (dropWhile (== '\n') $ dropWhile (/= '\n') s)

-- This is so much fun...
myLines' :: String -> [String]
myLines' = splitBy '\n'

shouldEqual :: [String]
shouldEqual =
  [ "Tyger Tyger, burning bright",
    "In the forests of the night",
    "What immortal hand or eye",
    "Could frame thy fearful symmetry?"
  ]
