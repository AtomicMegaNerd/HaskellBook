module Arith4 where

roundTrip :: (Show a, Read b) => a -> b
roundTrip = read . show

main :: IO ()
main = do
  print (roundTrip (4 :: Integer) :: Integer)
  print (id 4 :: Integer)
