module Ch12EitherLib where

lefts' :: [Either a b] -> [a]
lefts' = foldr ((++) . getLefts) []
  where getLefts :: Either a b -> [a]
        getLefts (Left a) = [a]
        getLefts _ = []

rights' :: [Either a b] -> [b]
rights' = foldr ((++) . getRights) []
  where getRights :: Either a b -> [b]
        getRights (Right b) = [b]
        getRights _ = []

