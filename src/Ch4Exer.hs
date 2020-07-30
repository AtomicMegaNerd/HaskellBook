module Ch4Exer where

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome xs = reverse xs == xs

rcdAbs :: Integer -> Integer
rcdAbs x
    | x < 0 = negate x
    | otherwise = x

rcdAbs' :: Integer -> Integer
rcdAbs' x = if x < 0 then negate x else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f t1 t2 = ((snd t1, snd t2), (fst t1, fst t2))

x = (+)

f' :: Foldable t => t a -> Int
f' xs = w `x` 1
    where w = length xs

f'' = (\x -> x)

f''' (a, b) = a
