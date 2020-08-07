module HigherOrder where

returnAfterApply :: (a -> b) -> a -> c -> b
returnAfterApply f a c = f a