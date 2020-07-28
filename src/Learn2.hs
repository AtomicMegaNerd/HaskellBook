module Learn2 where

-- This is a function RAWR!
printInc n = print plusTwo
  where plusTwo = n + 2

printInc2 n = let plusTwo = n + 2
              in print plusTwo

mult1 = x * y
  where x = 5
        y = 6

func2 = x * 3 + y
  where x = 3
        y = 1000



func3 = x * 5
  where y = 10
        x = 10 * 5 + y

func4 = z / x + y
   where x = 7
         y = negate x
         z = y * 10

z = 7
x = y ^ 2
waxOn = x * 5
y = z + 8

waxOn' = x * 5
  where z = 7
        y = z + 8
        x = y ^ 2

triple x = x * 3

waxOff x = triple x

doubleMe :: Num a => a -> a
doubleMe x = x * 2
