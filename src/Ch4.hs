module Ch4 where

data Mood = Blah | Woot deriving (Show)

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah

data Express = Rofl | Lol | Hihi deriving Show

displayExpress :: Express -> [Char]
displayExpress Rofl = "So much Rofl!"
displayExpress Lol = "Lol!!"
displayExpress Hihi = "Hihi!"
