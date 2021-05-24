module PhonePad where

import Data.Char (isUpper, toLower)
import Data.List (elemIndex)
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
convo = ["Wanna play 20 questions", "Ya", "U 1st haha", "Lol OK.  Have you ever tasted pepsi"]

reverseConvo :: Phone -> [String] -> [(Digit, Presses)]
reverseConvo p = foldr ((++) . reverseStr p) []

reverseStr :: Phone -> String -> [(Digit, Presses)]
reverseStr p = foldr ((++) . reverseTaps p) []

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

digitPresses :: [(Digit, Presses)] -> Presses
digitPresses = foldr ((+) . snd) 0
