module Ch4 where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _    = Blah

-- This is fun
map2D :: (a -> b) -> [[a]] -> [[b]]
map2D = map . map
