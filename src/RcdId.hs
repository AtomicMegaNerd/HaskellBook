module RcdId where

data Identity a = Identity a
  deriving Show

instance Eq a => Eq (Identity a) where
  (==) (Identity v1) (Identity v2) = v1 == v2