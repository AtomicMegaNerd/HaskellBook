module Ch11GuessWhat where

data GuessWhat = ChickenButt deriving (Eq, Show)

-- The book does not use newtype here so will ignore the suggestion of the linter
data Id a = MkId a deriving (Eq, Show)

data Product a b = Product a b deriving (Eq, Show)

data Sum a b = First a | Second b deriving (Eq, Show)

data RecordProduct a b = RecordProduct
  { pfirst :: a,
    psecond :: b
  }
  deriving (Eq, Show)

newtype NumCow = NumCow Int deriving (Eq, Show)

newtype NumPig = NumPig Int deriving (Eq, Show)

-- These two are the same
data FarmHouse = FarmHouse NumCow NumPig deriving (Eq, Show)

type FarmHouse' = Product NumCow NumPig

newtype NumSheep = NumSheep Int deriving (Eq, Show)

-- These two are the same as well... though with more than two values we need to do
-- some nesting
data BigFarmHouse = BigFarmHouse NumCow NumPig NumSheep deriving (Eq, Show)

type BigFarmHouse' = Product NumCow (Product NumPig NumSheep)

type Name = String

type Age = Int

type LovesMud = Bool

type PoundsOfWool = Int

data CowInfo = CowInfo Name Age deriving (Eq, Show)

data PigInfo = PigInfo Name Age LovesMud deriving (Eq, Show)

data SheepInfo = SheepInfo Name Age PoundsOfWool deriving (Eq, Show)

-- The two below definitions of animal are pretty much the same
data Animal = Cow CowInfo | Pig PigInfo | Sheep SheepInfo deriving (Eq, Show)

type Animal' = Sum CowInfo (Sum PigInfo SheepInfo)
