module Ch11Quantum where

-- Thi is a Sum Type
data Quantum = Yes | No | Both deriving (Eq, Show)

-- Either is also a sum type
qs1 :: Either Quantum Quantum
qs1 = Right Yes

qs2 :: Either Quantum Quantum
qs2 = Right No

qs3 :: Either Quantum Quantum
qs3 = Right Both

qs4 :: Either Quantum Quantum
qs4 = Left Yes

qs5 :: Either Quantum Quantum
qs5 = Left No

qs6 :: Either Quantum Quantum
qs6 = Left Both

convert :: Quantum -> Bool
convert Yes = True
convert No = True
convert Both = True

data Quad = One | Two | Three | Four deriving (Eq, Show)
