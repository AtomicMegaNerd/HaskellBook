module PatternMatching1 (isItTwo, isItThree) where

-- This is a cute little function
isItTwo :: Integer -> Bool
isItTwo 2 = True
isItTwo _ = False

-- This function should throw a warning...
isItThree :: Integer -> Bool
isItThree 3 = True
