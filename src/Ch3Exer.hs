module Ch3Exer where

exclam :: [Char] -> [Char]
exclam s = s ++ "!"

delta :: [Char] -> [Char]
delta s = [s !! 4]

getLastWord :: [Char] -> [Char]
getLastWord s = drop 9 s

thirdLetter :: [Char] -> Maybe Char
thirdLetter (x : y : z : xs) = Just y
thirdLetter _                = Nothing

letterIndex :: Int -> Char
letterIndex x = s !! x
    where s = "Cirry is awesome!"

-- Reverse our words
rvrs :: [Char] -> [Char]
rvrs  = unwords . reverse . words
