module Main where

import Cipher
import Palindrome
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

main :: IO ()
main =
  do
    hSetBuffering stdout NoBuffering
    --caesarFromUserInput
    -- userInputToVigenere
    palindrome
    putStrLn "Program Complete"
