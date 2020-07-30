module Reverse where

rvrs :: String -> String
rvrs = unwords . reverse . words

main :: IO()
main = print $ rvrs "Curry is awesome"
