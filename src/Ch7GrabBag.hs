module Ch7GrabBag where

mTh x y z = x * y * z

y = mTh 3

addOneIfOdd n = case odd n of
  True -> n + 1
  False -> n

addFive x y = (if x > y then y else x) + 5

addFive' = (\x -> \y -> (if x > y then y else x) + 5)

mflip f = \x -> \y -> f y x

mflip' f x y = f y x