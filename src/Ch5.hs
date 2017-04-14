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