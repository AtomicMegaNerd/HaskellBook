module Main where

import Ch9FinalExers

main :: IO ()
main = do
  let a1 = removeArticles "The brown dog was a goof"
  print a1

  putStrLn "Program complete"
