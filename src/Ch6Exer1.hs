module Ch6Exer1 where

data TisAnInteger = TisAn Integer
  deriving Show

instance Eq TisAnInteger where
  (==) (TisAn x) (TisAn y) = x == y

data TwoIntegers = Two Integer Integer
  deriving Show

instance Eq TwoIntegers where
  (==) (Two x1 y1) (Two x2 y2) = x1 == x2 && y1 == y2

data StringOrInt =
    TisAnInt Int
  | TisAString String
  deriving Show

instance Eq StringOrInt where
  (==) (TisAnInt i1) (TisAnInt i2) = i1 == i2
  (==) (TisAString s1) (TisAString s2) = s1 == s2
  (==) _ _ = False

data Pair a = Pair a a
  deriving Show

instance (Eq a) => Eq (Pair a) where
  (==) a b = a == b

data Tuple a b = Tuple a b
  deriving Show

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a1 b1) (Tuple a2 b2) = a1 == a2 && b1 == b2

data Which a =
    ThisOne a
  | ThatOne a
  deriving Show

instance (Eq a) => Eq (Which a) where
  (==) (ThisOne a1) (ThisOne a2) = a1 == a2
  (==) (ThatOne a1) (ThatOne a2) = a1 == a2
  (==) _ _ = False

data EitherOr a b =
    Hello a
  | Goodbye b
  deriving Show

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a1) (Hello a2) = a1 == a2
  (==) (Goodbye b1) (Goodbye b2) = b1 == b2
  (==) _ _ = False
