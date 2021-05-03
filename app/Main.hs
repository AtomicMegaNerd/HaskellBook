module Main where

import Cipher

main :: IO ()
main = do
  let keyword = "ALLY"
  let sourceText = "MEET AT DAWN"

  let encryptedText = vigenere Encrypt keyword sourceText
  let decryptedText = vigenere Decrypt keyword encryptedText

  putStrLn encryptedText
  putStrLn decryptedText

  putStrLn "Program Complete"
