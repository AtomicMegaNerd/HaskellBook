module Ch12Natural where

data Nat = Zero | Succ Nat deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger n = natToInteger' n 0
  where
    natToInteger' :: Nat -> Integer -> Integer
    natToInteger' Zero acc = acc
    natToInteger' (Succ n) acc = natToInteger' n (acc + 1)

integerToNat :: Integer -> Maybe Nat
integerToNat x
  | x < 0 = Nothing
  | otherwise = Just $ integerToNat' x
  where
    integerToNat' :: Integer -> Nat
    integerToNat' 0 = Zero
    integerToNat' x = Succ $ integerToNat' $ x - 1
