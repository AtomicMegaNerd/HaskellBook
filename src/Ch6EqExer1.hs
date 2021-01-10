module Ch6EqExer1 where

data TisAnInteger = TiSan Integer

instance Eq (TisAnInteger) where
  (==) (TiSan v) (TiSan v') =
    v == v'

data TwoIntegers = Two Integer Integer

instance Eq (TwoIntegers) where
  (==) (Two x y) (Two x' y') =
    x == x' && y == y'

data StringOrInt = TisAnInt Int | TisAString String

instance Eq (StringOrInt) where
  (==) (TisAnInt x) (TisAnInt y) = x == y
  (==) (TisAString x) (TisAString y) = x == y
  (==) _ _ = False

data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair x y) (Pair x' y') = x == x' && y == y'
  (==) _ _ = False

data Tuple a b = Tuple a Bool

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'
  (==) _ _ = False

data Which a = ThisOne a | ThatOne a

instance (Eq a) => Eq (Which a) where
  (==) (ThisOne a) (ThisOne b) = a == b
  (==) (ThatOne a) (ThatOne b) = a == b
  (==) _ _ = False

data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello b) = a == b
  (==) (Goodbye a) (Goodbye b) = a == b
  (==) _ _ = False
