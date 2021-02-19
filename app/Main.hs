module Main where

import MyWords (myWords')
import PoemLines (myLines, myLines', sentences, shouldEqual)

main :: IO ()
main = do
  let s = "Chris loves to code in Haskell"
  let w = myWords' s
  putStrLn s
  print w

  print $ "Are they equal? " ++ show (myLines sentences == shouldEqual)
  print $ "Are they equal? " ++ show (myLines' sentences == shouldEqual)

  putStrLn "Program complete..."
