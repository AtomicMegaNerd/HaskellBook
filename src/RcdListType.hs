module RcdListType where

data List a = Nil | Cons a (List a) deriving (Show)
