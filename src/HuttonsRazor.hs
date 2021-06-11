module HuttonsRazor where

data Expr = Lit Integer | Add Expr Expr

-- For example: eval (Add (Lit 1) (Lit 9001))
-- 9002
eval :: Expr -> Integer
eval (Lit a) = a
eval (Add x y) = eval x + eval y

-- Expected output: 
--Prelude> printExpr (Add (Lit 1) (Lit 9001))
--"1 + 9001"
--Prelude> a1 = Add (Lit 9001) (Lit 1)
--Prelude> a2 = Add a1 (Lit 20001)
--Prelude> a3 = Add (Lit 1) a2
--Prelude> printExpr a3
--"1 + 9001 + 1 + 20001"

printExpr :: Expr -> String
printExpr (Lit a) = show a
printExpr (Add x y) = printExpr x ++ " + " ++ printExpr y
