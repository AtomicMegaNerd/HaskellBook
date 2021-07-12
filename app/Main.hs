module Main where

import Ch13Exer4
import Cipher
import Palindrome
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

main :: IO ()
main =
  do
    hSetBuffering stdout NoBuffering
    --caesarFromUserInput
    -- userInputToVigenere
    -- palindrome
    gimmePerson
    putStrLn "Program Complete"
