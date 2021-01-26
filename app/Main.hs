module Main where

import Ch7Exer

main :: IO ()
main = do
  let x1 = tensDigit 5
  let x2 = tensDigit 50
  let x3 = tensDigit 510
  print (x1, x2, x3)

  let x4 = tensDigit' 5
  let x5 = tensDigit' 50
  let x6 = tensDigit' 510
  print (x4, x5, x6)

  let x7 = hunsDigit 62
  let x8 = hunsDigit 124
  let x9 = hunsDigit 4366
  let x10 = hunsDigit 82790
  print (x7, x8, x9, x10)

  putStrLn "Program complete"
