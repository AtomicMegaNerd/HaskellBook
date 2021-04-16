module Ch10WarmupExercises where

stops :: [Char]
stops = "pbtdkg"

vowels :: [Char]
vowels = "aeiou"

verbs :: [String]
verbs = ["run", "stop", "buy", "sell", "eat"]

nouns :: [String]
nouns = ["house", "pizza", "dog", "computer", "cloud"]

makeAllCombinationsXYX :: [a] -> [b] -> [c] -> [(a, b, c)]
makeAllCombinationsXYX x y z =
  [ make3Tuple x y z i j k
    | i <- [0 .. (length x - 1)],
      j <- [0 .. (length y - 1)],
      k <- [0 .. (length z - 1)]
  ]
  where
    make3Tuple :: [a] -> [b] -> [c] -> Int -> Int -> Int -> (a, b, c)
    make3Tuple x y z i j k = (x !! i, y !! j, z !! k)

makeAllCombinationsOfStopsAndVowels :: [(Char, Char, Char)]
makeAllCombinationsOfStopsAndVowels = makeAllCombinationsXYX stops vowels stops

makeAllCombinationsOfStopsAndVowelsThatStartWithP :: [(Char, Char, Char)]
makeAllCombinationsOfStopsAndVowelsThatStartWithP = makeAllCombinationsXYX "p" vowels stops

makeAllCombinationsOfNounsAndVerbs :: [(String, String, String)]
makeAllCombinationsOfNounsAndVerbs = makeAllCombinationsXYX nouns verbs nouns