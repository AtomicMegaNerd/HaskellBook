module Ch4 where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _    = Blah

-- This is fun
map2D :: (a -> b) -> [[a]] -> [[b]]
map2D = map . map
data Express = Rofl | Lol | Hihi deriving Show

displayExpress :: Express -> [Char]
displayExpress Rofl = "So much Rofl!"
displayExpress Lol  = "Lol!!"
displayExpress Hihi = "Hihi!"

rcd_map :: (a -> b) -> [a] -> [b]
rcd_map _ []     = []
rcd_map f (x:xs) = (f x) : (rcd_map f xs)

-- This is concat
rcd_concat :: [a] -> [a] -> [a]
rcd_concat [] ys     = ys
rcd_concat (x:xs) ys = x : (rcd_concat xs ys)
