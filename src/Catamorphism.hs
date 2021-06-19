module Catamorphism where

import Data.Bool

-- The follow are catamorphisms
x :: Integer
x = bool 3 4 True

-- If the Maybe is Nothing the first value will be returned
-- Otherwise the value of function will be returned
y :: Integer
y = maybe 3 (\x -> 4) (Just 18)

-- If the Either is Left the value of the first lambda will be
-- returned otherwise if it is Right the value of the second lambda will
-- be returned.
z :: Integer
z = either (\x -> 9) (\y -> 10) (Left 3)
