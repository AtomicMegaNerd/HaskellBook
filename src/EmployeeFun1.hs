module EmployeeFun1 where

data Employee = Coder | Manager | Veep | CEO deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e1 e2 = putStrLn $ show e1 ++ " is the boss of " ++ show e2

employeeRank :: (Employee -> Employee -> Ordering) -> Employee -> Employee -> IO ()
employeeRank f e1 e2 =
  case f e1 e2 of
    GT -> reportBoss e1 e2
    EQ -> putStrLn "Neither employee is the boss"
    LT -> (flip reportBoss) e1 e2

codersRuleCEOsDrool :: Employee -> Employee -> Ordering
codersRuleCEOsDrool Coder Coder = EQ
codersRuleCEOsDrool Coder _ = GT
codersRuleCEOsDrool _ Coder = LT
codersRuleCEOsDrool e e' = compare e e'
