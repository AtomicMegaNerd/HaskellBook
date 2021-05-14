module Ch11Exers where

import Data.Char

-- As-patterns are an interesting idea that let's you both refer to something as a whole
-- as well as a part of that same something.

showFirstTupleVal :: Show a => (a, b) -> IO (a, b)
showFirstTupleVal t@(a, _) = do
  print a
  return t

-- Here I can refer both to the entire list itself as well as the first item in
-- the list.  Very cool!
doubleUp :: [a] -> [a]
doubleUp [] = []
doubleUp xs@(x : _) = x : xs

-- Okay, now for the exercises.
-- 1. This should return True if (and only if) all the values in the first list
-- appear in the second list, though they need not be contiguous:

-- This almost works, but the sub-sequence has to be found in list 2 in the same order.
-- Also we are not using as-patterns here.
isSubseqOf' :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf' xs ys = foldr (\x acc -> x `elem` ys && acc) True xs

-- This is the actual solution!
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf sub@(x : xs) (y : ys)
  | x == y = isSubseqOf xs ys
  | otherwise = isSubseqOf sub ys

-- This function takes a string and splits that string by a character that we provide which
-- can be a period, a comma, a space, or anything else we want.  This may be a bit grotesque
-- but I am still new at Haskell and it certainly works!
splitStringByChar :: Char -> String -> [String]
splitStringByChar _ [] = []
splitStringByChar ch sent = fst res : splitStringByChar ch (snd res)
  where
    res:: (String, String)
    res = mkWord sent
    mkWord :: String -> (String, String) 
    mkWord sent = mkWordInner sent ([],[])
      where
        mkWordInner :: String -> (String, String) -> (String, String)
        mkWordInner [] buffer = buffer
        mkWordInner (x:xs) (word, _)
          | x == ch = (word, xs)
          | otherwise = mkWordInner xs (word ++ [x], xs)

joinStringsByChar :: Char -> [String] -> String 
joinStringsByChar ch stringList = joinInner stringList []
  where
    joinInner :: [String] -> String -> String
    joinInner [] buffer = buffer
    joinInner (x:xs) buffer = x ++ [ch] ++ joinInner xs buffer

-- I can use my splitStringByChar function to define my own version of the words function.
rcdWords :: String -> [String]
rcdWords = splitStringByChar ' '

splitSentences :: String -> [String]
splitSentences = splitStringByChar '.'

joinSentences :: [String] -> String 
joinSentences = joinStringsByChar '.'

-- This function capitalizes the first letter of every word.
capitalizeWord :: String -> String 
capitalizeWord [] = []
capitalizeWord (x:xs) = toUpper x : xs

-- This function splits a sentence into words and returns a tuple of each word both 
-- capitalized and not capitalized.
capitalizeWords :: String -> [(String, String)]
capitalizeWords sent = map cAndT (rcdWords sent)
  where
    cAndT :: String -> (String, String)
    cAndT orig@(x:xs) = (orig, toUpper x : xs)

-- This function will capitalize the first word in each sentence in a paragraph.  This is really
-- ugly because we have to account for spaces.
capitalizeParagraph :: String -> String 
capitalizeParagraph = joinSentences . map capitalizeFirstLetterInAString . splitSentences
  where
    capitalizeFirstLetterInAString :: String -> String
    capitalizeFirstLetterInAString s = inner s []
      where
        inner :: String -> String -> String
        inner [] buffer = buffer
        inner orig@(x:xs) buffer
          | isLetter x = buffer ++ capitalizeWord orig
          | otherwise = inner xs (x:buffer)

