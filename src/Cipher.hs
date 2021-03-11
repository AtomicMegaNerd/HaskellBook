module Cipher where

import Data.Char (chr, isLetter, isLower, isUpper, ord)

-- This is a caesar cipher
-- This will scramble letters in a sentence by the provided offset.  However, the
-- letters will wrap-around so that if you offest 'z' or 'Z' by 1 it wraps back around
-- to 'a' or 'A'.  It works with both cases.  Punctuation characters are not affected.
--
-- Arguments:
-- offset - the number of characters to offset by.  Must be a positive number
-- xs - the string the scramble
caesar :: Int -> [Char] -> [Char]
caesar _ [] = []
caesar o (x : xs) = shift : caesar o xs
  where
    shift
      | isLower x && (ix - ord 'a') >= 26 = chr (ix - 26)
      | isUpper x && (ix - ord 'A') >= 26 = chr (ix - 26)
      | isLetter x = chr ix
      | otherwise = x
    ix = ord x + offset
    offset = o `mod` 26

-- This de-scrambles the caesar cipher as long as the offest argument passed into
-- this function matches the offest passed in to the uncasar function.
--
-- Arguments:
-- offset - the number of characters to offset by.. must be a positive number
-- xs - the string the scramble
uncaesar :: Int -> [Char] -> [Char]
uncaesar offset = caesar (- offset)
