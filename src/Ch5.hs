module Ch5 where

addStuff :: (Num a) => a -> a -> a
addStuff a b = a + b + 5

subtractStuff :: (Num a) => a -> a -> a
subtractStuff x y = x - y - 10

subtractOne :: (Num a) => a -> a
subtractOne = subtractStuff 1

rcd_sub :: (Num a) => a -> a -> a
rcd_sub x y = x - y

nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

curriedFunction :: Integer -> Bool -> Integer
curriedFunction i b = i + (nonsense b)

uncurriedFunction :: (Integer, Bool) -> Integer
uncurriedFunction (i, b) = i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonsense b)

anonNested :: Integer -> Bool -> Integer
anonNested = \i -> \b -> i + (nonsense b)

so_much_haskell :: a -> a -> a
so_much_haskell x y = x

so_much_haskell' :: a -> a -> a
so_much_haskell' x y = y

abb :: a -> b -> b
abb x y = y
