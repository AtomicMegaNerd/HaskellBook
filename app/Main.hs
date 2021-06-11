module Main where

import HuttonsRazor

main :: IO ()
main =
  do
    print $ eval (Add (Lit 1) (Lit 9001))
    putStrLn $ printExpr (Add (Lit 1) (Lit 9001))
    let a1 = Add (Lit 9001) (Lit 1)
    let a2 = Add a1(Lit 20001) 
    let a3 = Add (Lit 1) a2
    putStrLn $ printExpr a3
    putStrLn "Program Complete"
