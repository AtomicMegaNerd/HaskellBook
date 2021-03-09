module Main where

import Ch9ListCompr

main :: IO ()
main = do
  let s1 = "Pants AdministratioN and Tracking System"
  putStrLn $ removeAllLower s1
  putStrLn "Program complete..."
