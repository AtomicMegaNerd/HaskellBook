module FunWithBool where

import Data.Int

-- Cardinality is 4
data BigSmall = Big Bool | Small Bool deriving (Eq, Show)

-- Cardinality is 258 (256 + 2)
data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show)

-- Let's explore the cardinality of product types

-- Obviously this Sum type that we start with has a cardinality of 3
data QuantumBool = QuantumTrue | QuantumFalse | QuantomBoth deriving (Eq, Show)

-- Cardinality for this Product Type is 9 because each QuantumBool is 3 and you multiply
-- the cardinality of each argument to the data constructor
data TwoQs = MkTwoQs QuantumBool QuantumBool deriving (Eq, Show)

-- This is a type alias for a Tuple of two QuantumBools.  Same cardinality as TwoQs which is
-- 9 even though this is just a type alias and not a new data type as above
type TwoQs' = (QuantumBool, QuantumBool)
