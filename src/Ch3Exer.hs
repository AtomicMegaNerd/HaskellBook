module Ch3Exer where

exclam :: [Char] -> [Char]
exclam s = s ++ "!"

getLastLetterInFirstWord :: [Char] -> [Char]
getLastLetterInFirstWord s = drop (l - 1) fw
    where l = length fw
          fw = wds !! 0
          wds = words s

getLastWord :: [Char] -> [Char]
getLastWord s = w !! (length w - 1)
    where w = words s

thirdLetter :: [Char] -> Char
thirdLetter s = s !! 2

letterIndex :: Int -> Char
letterIndex x = s !! x
    where s = "Curry is awesome!"

rvrs :: [Char] -> [Char]
rvrs s = unwords $ reverse wds
    where wds = words s

main :: IO ()
main = do
    print $ exclam "Curry is awesome"
    print $ getLastLetterInFirstWord "Curry is awesome!"
    print $ getLastWord "Curry is awesome!"
    print $ thirdLetter "Curry is awesome!"
    print $ letterIndex 5
    print $ rvrs "Curry is awesome"