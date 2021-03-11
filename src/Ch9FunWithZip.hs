module Ch9FunWithZip where

rcdZip :: [a] -> [b] -> [(a, b)]
rcdZip [] _ = []
rcdZip _ [] = []
rcdZip (x : xs) (y : ys) = (x, y) : rcdZip xs ys

rcdZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
rcdZipWith _ [] _ = []
rcdZipWith _ _ [] = []
rcdZipWith f (x : xs) (y : ys) = f x y : rcdZipWith f xs ys

rcdZip' :: [a] -> [b] -> [(a, b)]
rcdZip' = rcdZipWith makeTuple
  where
    makeTuple x y = (x, y)