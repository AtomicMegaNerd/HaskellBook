module Records where

data Person = Person
  { name :: String,
    age :: Int
  }
  deriving (Eq, Show)
