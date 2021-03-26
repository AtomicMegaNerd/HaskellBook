module Main where

import Ch10DbProc

main :: IO ()
main = do
  let ilist = filterDbNumber theDatabase

  print ilist

  let mostRecentDate = mostRecent theDatabase
  print mostRecentDate

  let sum = sumDb theDatabase
  print sum

  let avg = avgDb theDatabase
  print avg

  putStrLn "Program complete"
