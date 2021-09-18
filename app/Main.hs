module Main where

import Arbitrary1
import Arbitrary2
import Arbitrary3
import Test.QuickCheck

main :: IO ()
main =
  do
    sample trivialGen
    sample identityGenInt
    sample identityGenStr
    sample identityGenTuple2Int
    sample pairGenIntString
