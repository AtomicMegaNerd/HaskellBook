module Main where

import Ch9ListEnumFun

main :: IO ()
main = do
  let xs = eftChar 'a' 'd'
  print xs

  let xs' = eftInt 1 9
  print xs'

  putStrLn "Program complete"
