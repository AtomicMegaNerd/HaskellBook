module Main where

import WordNumber

main :: IO ()
main = do
  let l = digits 134564
  mapM_ print l

  let r = wordNumber 134564
  print r

  let r' = wordNumber' 134564
  print r'

  let r'' = wordNumber'' 134564
  print r''

  putStrLn "Program complete"
