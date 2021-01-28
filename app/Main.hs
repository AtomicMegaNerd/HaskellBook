module Main where

import Factorial
import Ch8RecursiveFun

main :: IO ()
main = do
  let x = factorial 5 :: Integer
  print x

  let y = incTimes 5 5 :: Integer
  print y

  let z = incTimes' 10 10 :: Integer
  print z

  putStrLn "Program complete"
