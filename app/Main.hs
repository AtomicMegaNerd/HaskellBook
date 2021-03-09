module Main where

import Ch9ListCompExer1

main :: IO ()
main = do
  let t1 = [(x, y) | x <- mySqr, x < 50, y <- myCube, y < 50]
  let l1 = length t1

  print t1
  print l1

  putStrLn "Program complete"
