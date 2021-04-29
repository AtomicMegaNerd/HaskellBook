module Main where

import Ch11Fun1

main :: IO ()
main = do
  -- Makwa is the cutest dog name ever
  let makwa = Schnoodle "Makwa"
  print $ printDogName makwa
  putStrLn "Program complete"
