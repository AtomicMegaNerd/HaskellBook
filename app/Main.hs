module Main where

import Ch8Exers

main :: IO ()
main = do
  let a1 = appedCatty "woohoo!"
  print a1

  let a2 = frappe "1"
  print a2

  let a3 = frappe (appedCatty "2")
  print a3

  let a4 = appedCatty (frappe "blue")
  print a4

  let a5 = cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))
  print a5

  let a6 = cattyConny (flippy "Pugs" "are") "awesome"
  print a6

  let sumFun1 = rcdAddSums 5 :: Integer
  print sumFun1

  let m1 = rcdSumMult 4 5 :: Integer
  print m1

  let m2 = rcdSumMult 3 5 :: Integer
  print m2

  let m3 = rcdSumMult 7 8 :: Integer
  print m3

  let d1 = dividedBy (-20) 5
  print d1

  let d2 = dividedBy (-20) (-5)
  print d2

  let d3 = dividedBy (20) 5
  print d3

  let d4 = dividedBy 20 (-5)
  print d4

  putStrLn "Program complete"
