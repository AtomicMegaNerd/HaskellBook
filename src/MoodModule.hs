module MoodModule where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Woot = Blah
changeMood Blah = Woot

main = do
    print $ changeMood Woot
    print $ changeMood Blah