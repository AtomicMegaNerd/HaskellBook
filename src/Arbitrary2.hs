module Arbitrary2 where

import Test.QuickCheck

data Identity a = Identity a deriving (Eq, Show)

-- This is Monadic so will have to come back to it
identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = identityGen

-- This constrains our identityGen to Integers
identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen

identityGenStr :: Gen (Identity String)
identityGenStr = identityGen

identityGenTuple2Int :: Gen (Identity (Int, Int))
identityGenTuple2Int = identityGen
