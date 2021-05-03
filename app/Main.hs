module Main where

import Cipher

main :: IO ()
main = do
  let keyword = "ALLY"
  let sourceText = "MEET AT DAWN"

  let encryptedText = vigenere keyword sourceText

  putStrLn encryptedText
  putStrLn "Program Complete"
