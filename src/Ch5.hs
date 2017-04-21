module Ch5 where

addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5

nonsense :: Bool -> Integer 
nonsense True = 805 
nonsense False = 31337

curriedFunction :: Integer
                -> Bool
                -> Integer 
curriedFunction i b =
    i + (nonsense b)

uncurriedFunction :: (Integer, Bool) -> Integer
uncurriedFunction (i, b) = i + (nonsense b)

anonymous :: Integer -> Bool -> Integer 
anonymous = \i b -> i + (nonsense b)

anonNested :: Integer
           -> Bool
           -> Integer
anonNested =
    \i -> \b -> i + (nonsense b)

-- How many ways can we implemenet a -> a -> a

roflLeft :: a -> a-> a
roflLeft x y = x

roflRight :: a -> a -> a
roflRight x y = y

roflAwesomeSauce :: a -> b -> b
roflAwesomeSauce x y = y
