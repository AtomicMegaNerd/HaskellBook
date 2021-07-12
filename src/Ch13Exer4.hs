module Ch13Exer4 where

type Name = String

type Age = Integer

data Person = Person Name Age deriving (Show)

data PersonInvalid = NameEmpty | AgeTooLow | PersonInvalidUnknown String deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == "" = Left NameEmpty
  | age <= 0 = Left AgeTooLow
  | otherwise =
    Left $ PersonInvalidUnknown $
      "Name was " ++ show name ++ " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStr "Enter the name of the person: "
  name <- getLine
  putStr "Enter the age of the person: "
  age <- readLn
  let person = mkPerson name (age :: Integer)
  putStrLn $ printResponse person

printResponse :: Either PersonInvalid Person -> String
printResponse (Right p) = "Yay! Successfully got a person: " ++ show p
printResponse (Left p) = "Error constructing person: " ++ show p
