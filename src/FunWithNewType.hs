{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module FunWithNewType where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

-- To devive TooMany automatically like this from Int we need the language
-- extension that is enabled above (GeneralizedNewtypeDeriving).
newtype Goats = Goats Int deriving (Eq, Show, TooMany)

-- newtype Goats = Goats Int deriving (Eq, Show)

-- Otherwise if the language extension is not there we need to provide our own
-- instance of TooMany explicitly for Goats like the example below:
-- instance TooMany Goats where
--   tooMany (Goats n) = tooMany n

newtype Cows = Cows Int deriving (Eq, Show)

-- These functions below just demonstrate that we cannot mix up Cows and Goats.

tooManyGoats :: Goats -> Bool
tooManyGoats (Goats n) = n > 42

tooManyCows :: Cows -> Bool
tooManyCows (Cows n) = n > 12

-- Now let's do some more exercises :)

-- This requires FlexibleInstances
instance TooMany (Int, String) where
  tooMany (n, "Goats") = n > 42
  tooMany (n, "Cows") = n > 12
  tooMany _ = False

-- This also requires FlexibleInstances
instance TooMany (Int, Int) where
  tooMany (x, y) = (x + y) > 42

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany x && tooMany y
