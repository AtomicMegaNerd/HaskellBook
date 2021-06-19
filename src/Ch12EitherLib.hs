module Ch12EitherLib where

-- I could use concatMap here but the book says to use foldr
-- so that's what I am doing
lefts' :: [Either a b] -> [a]
lefts' = foldr ((++) . getLefts) []
  where
    getLefts :: Either a b -> [a]
    getLefts (Left a) = [a]
    getLefts _ = []

-- I could use concatMap here but the book says to use foldr
-- so that's what I am doing
rights' :: [Either a b] -> [b]
rights' = foldr ((++) . getRights) []
  where
    getRights :: Either a b -> [b]
    getRights (Right b) = [b]
    getRights _ = []

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f (Left _) = Nothing
eitherMaybe' f (Right b) = Just (f b)

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f g (Left a) = f a
either' f g (Right b) = g b

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (\a -> Nothing) (\b -> Just (f b))
