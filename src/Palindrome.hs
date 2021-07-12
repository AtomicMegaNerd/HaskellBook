module Palindrome where

import Control.Monad
import Data.Char

palindrome :: IO ()
palindrome = forever $ do
  putStr "Enter some text that could be a palindrome: "
  line1 <- getLine
  let text = processText line1
  case text == reverse text of
    True -> putStrLn "The text is a palindrome!"
    False -> putStrLn "The text is not a palindrome"
  where
    processText = map toLower . filter isLetter
