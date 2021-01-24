module Main where

import RegisteredUser

main :: IO ()
main = do
  putStrLn "Printing user list..."

  let u1 = UnregisteredUser
  let u2 = RegisteredUser (Username "cdunphy") (AccountNumber 12345)

  printUser u1
  printUser u2

  putStrLn "Program complete"
