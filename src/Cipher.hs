module Cipher where

import Data.Char (chr, isLetter, isLower, isUpper, ord)

-- This utility function is used by both the caesar and vigenere ciphers below.
-- The first argument is o which is the positive numerical offest.  Please note that
-- any number larger than 26 supplied for o will be modulus 26.
--
-- The second argument is the character x to shift
shift :: Int -> Char -> Char
shift o x
  | isLower x && (ix - ord 'a') >= 26 = chr (ix - 26)
  | isUpper x && (ix - ord 'A') >= 26 = chr (ix - 26)
  | isLetter x = chr ix
  | otherwise = x -- punctuation and spaces
  where
    ix = ord x + o `mod` 26

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
caesar o (x : xs) = shift o x : caesar o xs

-- This de-scrambles the caesar cipher as long as the offest argument passed into
-- this function matches the offest passed in to the uncasar function.
--
-- Arguments:
-- offset - the number of characters to offset by.. must be a positive number
-- xs - the string the scramble
uncaesar :: Int -> [Char] -> [Char]
uncaesar offset = caesar (- offset)

-- More fun with ciphers from Chapter 11 of the HaskelBook.  See the book
-- for a description of how this cipher works.
--
-- Arguments:
-- ==========
--
-- mode - This is either set to Encrypt or Decrypt.
--
-- keyword - the word to use as the cipher.  Each letter of the keyword indicates how many
-- right shifts will be applied to the next character in the text.
--
-- text - The text to be encrypted.

data Mode = Encrypt | Decrypt deriving (Eq, Show)

vigenere :: Mode -> [Char] -> [Char] -> [Char]
vigenere mode keyword = encrypt mode shiftMask
  where
    shiftMask = cycle keyword -- This repeats infintely but Haskell is lazy
    encrypt _ _ [] = []
    encrypt mode (k : ks) (x : xs)
      | isLetter x && mode == Encrypt = shift ix x : encrypt mode ks xs
      | isLetter x && mode == Decrypt = shift (- ix) x : encrypt mode ks xs
      | otherwise = x : encrypt mode (k : ks) xs -- Put k back so we can use it on the next letter
      where
        ix
          -- Here we know that k must be a letter so we can assume in the otherwise
          -- clause that it is upper-case.
          | isLower k = ord k - ord 'a'
          | otherwise = ord k - ord 'A'
