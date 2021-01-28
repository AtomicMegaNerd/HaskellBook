module Main where

import Factorial

main :: IO ()
main = do
  let x = factorial 5
  print x
  putStrLn "Program complete"
