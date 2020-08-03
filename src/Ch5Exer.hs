module Ch5Exer where

functionH :: [a] -> a
functionH (x : _) = x

functionC :: (Ord a) => a -> a -> Bool
functionC x y = if (x > y) then True else False

functionS :: (a, b) -> b
functionS (x, y) = y

i :: a -> a
i x = x

c :: a -> b -> a
c x y = x

c' :: a -> b -> b
c' x y = y

r :: [a] -> [a]
r x = x

co :: (b -> c) -> (a -> b) -> a -> c
co f1 f2 a = f1 $ f2 a

a :: (a -> c) -> a -> a
a f1 a = a

a' :: (a -> b) -> a -> b
a' f1 a = f1 a

-- Type Kwon Do

-- 1
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h i = g $ f i

-- 2
data A

data B

data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e a = w $ q a

-- 3
data X

data Y

data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)

-- 4

munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge f1 f2 x = fst $ f2 $ f1 x