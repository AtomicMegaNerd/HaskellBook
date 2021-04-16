module Main where

import Ch10WarmupExercises

main :: IO ()
main = do
  print makeAllCombinationsOfStopsAndVowels
  putStrLn "---"
  print makeAllCombinationsOfStopsAndVowelsThatStartWithP
  putStrLn "---"
  print makeAllCombinationsOfNounsAndVerbs
  putStrLn "---"

  putStrLn "Program complete"
