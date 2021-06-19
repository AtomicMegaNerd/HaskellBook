module Ch12Unfolds where

import Data.Maybe

-- The first version of this function uses basic direct recursion
rcdIterate :: (a -> a) -> a -> [a]
rcdIterate f x = x : rcdIterate f (f x)

-- Also basic direct recursion for the initial version of rcdUnfoldr
rcdUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
rcdUnfoldr f b = fst fromTuple : rcdUnfoldr f (snd fromTuple)
  where
    fromTuple = fromJust (f b)

-- Re-implementing rcdIterate based on rcdUnfoldr
rcdIterate' :: (a -> a) -> a -> [a]
rcdIterate' f = rcdUnfoldr (\y -> Just (y, f y))
