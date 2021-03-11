module Main where

import Cipher (caesar, uncaesar)

main :: IO ()
main = do
  let offset = 5

  let m1 = "AbC"
  let m2 = "XYz"

  let m3 = "This is a fun sentence.  Hello world!"

  let c1 = caesar offset m1
  let c2 = caesar offset m2
  let c3 = caesar offset m3

  print c1
  print c2
  print c3

  let d1 = uncaesar offset c3

  print d1

  putStrLn "Program complete"
