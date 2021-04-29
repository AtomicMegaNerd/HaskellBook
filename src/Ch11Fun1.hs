module Ch11Fun1 where

data Dog a
  = Husky a
  | Mastiff a
  | Schnoodle a
  | BostonTerrier a
  deriving (Eq, Show)

printDogName :: Dog String -> String
printDogName (Husky a) = a
printDogName (Schnoodle a) = a
printDogName _ = "Who cares?"

rofl :: Maybe String -> String
rofl (Just x) = x
rofl Nothing = "Whut?"
