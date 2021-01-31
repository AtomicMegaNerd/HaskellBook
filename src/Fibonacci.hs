module Fibonacci (rcd_fib) where

rcd_fib :: Integer -> Integer
rcd_fib 0 = 0
rcd_fib 1 = 1
rcd_fib x = rcd_fib (x - 1) + rcd_fib (x - 2)
