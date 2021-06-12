module PhonePad where

import Data.Char (isLetter, isUpper, toLower)
import Data.List (elemIndex, intercalate, nub)
import Data.Maybe (fromJust)

type Key = (Digit, String)

newtype Phone = Phone [Key] deriving (Eq, Ord, Show)

phone =
  Phone
    [ ('1', "1"),
      ('2', "abc2"),
      ('3', "def3"),
      ('4', "ghi4"),
      ('5', "jkl5"),
      ('6', "mno6"),
      ('7', "pqrs7"),
      ('8', "tuv8"),
      ('9', "wxyz9"),
      ('0', " 0"),
      ('#', ".,#")
    ]

-- ValidButtons = "1234567890*#"
type Digit = Char

-- Valid preses: 1 and up
type Presses = Int

convo :: [String]
convo = ["Wanna play 20 questions", "Ya", "You 1st haha", "Ya", "Lol OK.  Have you ever tasted pepsi", "Ya", "Lol"]

reverseConvo :: Phone -> [String] -> [(Digit, Presses)]
reverseConvo = concatMap . reverseStr

reverseStr :: Phone -> String -> [(Digit, Presses)]
reverseStr = concatMap . reverseTaps

reverseTaps :: Phone -> Char -> [(Digit, Presses)]
reverseTaps ph ch
  | isUpper ch = ('*', 1) : reverseTaps ph (toLower ch)
  | otherwise = [reverseTap ph ch]

reverseTap :: Phone -> Char -> (Digit, Presses)
reverseTap (Phone keys) ch = tap keys ch
  where
    tap :: [Key] -> Char -> (Digit, Presses)
    tap [] ch = error "Invalid character"
    tap (x : xs) ch
      | ch `elem` snd x = (fst x, fromJust (ch `elemIndex` snd x) + 1)
      | otherwise = tap xs ch

-- How many times do digits need to be pressed for each message
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = foldr ((+) . snd) 0

charCost :: Phone -> Char -> Presses
charCost ph ch = fingerTaps (reverseTaps ph ch)

messageCost :: Phone -> String -> Presses
messageCost ph = foldr ((+) . charCost ph) 0

countElemOccurs :: (Eq a, Ord a) => a -> [a] -> Int
countElemOccurs ch = foldr ((+) . (\elem -> if elem == ch then 1 else 0)) 0

countElemsInListOccurs :: (Eq a, Ord a) => [a] -> [(a, Int)]
countElemsInListOccurs s = concatMap (\ch -> [(ch, countElemOccurs ch s)]) $ nub s

mostPopItem :: (Eq a, Ord a) => [a] -> (a, Int) -> (a, Int)
mostPopItem s init =
  foldr
    (\(ch, count) (maxCh, max) -> if count > max && ch /= fst init then (ch, count) else (maxCh, max))
    init
    $ countElemsInListOccurs s

mostPopularLetter :: String -> Char
mostPopularLetter s = fst $ mostPopItem s (' ', 0)

mostPopularWord :: [String] -> String
mostPopularWord s = fst $ mostPopItem s (" ", 0)

coolestLtr :: [String] -> Char
coolestLtr = mostPopularLetter . unwords

coolestWord :: [String] -> String
coolestWord = mostPopularWord . words . intercalate " "
