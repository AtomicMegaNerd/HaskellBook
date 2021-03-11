module Ch9ChapterExers where

import Data.Char (isUpper, toUpper)

rcdStrFilterIsUpper :: [Char] -> [Char]
rcdStrFilterIsUpper = filter isUpper

rcdCapFirstLetter :: [Char] -> [Char]
rcdCapFirstLetter [] = []
rcdCapFirstLetter (x : xs) = toUpper x : xs

rcdStrToUpper :: [Char] -> [Char]
rcdStrToUpper = map toUpper

rcdFirstLetterOnly :: [Char] -> Maybe Char
rcdFirstLetterOnly [] = Nothing
rcdFirstLetterOnly xs = Just (toUpper $ head xs)