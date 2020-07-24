module Lib
  ( someFunc,
    sayHello,
  )
where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

adder :: Num a => a -> a -> a
adder x y = x + y

triple :: Num a => a -> a
triple x = x * 3

multByPi :: Floating a => a -> a
multByPi x = pi * x
