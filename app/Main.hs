module Main where

import Ch11GuessWhat

main :: IO ()
main = do
  let bess' = (CowInfo "Bess" 4)
  let bess = First bess' :: Animal'

  putStrLn "Program Complete"
