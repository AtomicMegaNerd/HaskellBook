module Ch12Fun1 where

ifEvenAdd2 :: Integer -> Maybe Integer
ifEvenAdd2 n = if even n then Just (n + 2) else Nothing

type Name = String
type Age = Integer

-- Using a list for Left allows us to pass back multiple error conditions as required
type ValidatePerson a = Either [PersonInvalid] a

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty | AgeTooLow deriving (Eq, Show)

ageOkay :: Age -> Either [PersonInvalid] Age
ageOkay age = if age >= 0 then Right age else Left [AgeTooLow]

nameOkay :: Name -> Either [PersonInvalid] Name
nameOkay name = if name /= "" then Right name else Left [NameEmpty]

-- Please note that it is the convention in Haskell to use the Left side
-- of Either for invalid or error conditions.
mkPerson :: Name -> Age -> ValidatePerson Person
mkPerson name age = mkPerson' (nameOkay name) (ageOkay age)

mkPerson' :: ValidatePerson Name -> ValidatePerson Age -> ValidatePerson Person
mkPerson' (Right nameOk) (Right ageOk) = Right (Person nameOk ageOk)
mkPerson' (Left badName) (Left badAge) = Left (badName ++ badAge)
mkPerson' (Left badName) _ = Left badName
mkPerson' _ (Left badAge) = Left badAge

