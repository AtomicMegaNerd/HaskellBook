module Main where

import PhonePad

main :: IO ()
main =
  do
    let roflstar = reverseConvo phone convo
    print roflstar

    let numPresses = digitPresses roflstar
    print numPresses

    putStrLn "Program Complete"
