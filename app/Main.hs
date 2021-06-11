module Main where

import PhonePad

main :: IO ()
main =
  do
    let roflstar = reverseConvo phone convo
    print roflstar

    let numPresses = fingerTaps roflstar
    print numPresses

    let testSentence1 = "Hello"
    let charCounts = countElemsInListOccurs testSentence1
    let mostPopular = mostPopularLetter testSentence1

    print charCounts
    print mostPopular

    let coolest = coolestLtr convo 
    print coolest

    let coolestW = coolestWord convo 
    print coolestW

    putStrLn "Program Complete"
