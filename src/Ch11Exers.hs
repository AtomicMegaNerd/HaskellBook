module Ch11Exers where

-- As-patterns are an interesting idea that let's you both refer to something as a whole
-- as well as a part of that same something.

showFirstTupleVal :: Show a => (a, b) -> IO (a, b)
showFirstTupleVal t@(a, _) = do
  print a
  return t

-- Here I can refer both to the entire list itself as well as the first item in
-- the list.  Very cool!
doubleUp :: [a] -> [a]
doubleUp [] = []
doubleUp xs@(x : _) = x : xs

-- Okay, now for the exercises.
-- 1. This should return True if (and only if) all the values in the first list
-- appear in the second list, though they need not be contiguous:

-- This almost works, but the sub-sequence has to be found in list 2 in the same order.
-- Also we are not using as-patterns here.
isSubseqOf' :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf' xs ys = foldr (\x acc -> x `elem` ys && acc) True xs

-- This is the actual solution!
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf sub@(x : xs) (y : ys)
  | x == y = isSubseqOf xs ys
  | otherwise = isSubseqOf sub ys
