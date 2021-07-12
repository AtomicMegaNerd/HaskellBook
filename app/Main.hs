module Main where

import Cipher
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

main :: IO ()
main =
  do
    hSetBuffering stdout NoBuffering
    --caesarFromUserInput
    userInputToVigenere
    putStrLn "Program Complete"
