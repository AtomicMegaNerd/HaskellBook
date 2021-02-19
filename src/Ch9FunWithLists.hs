module Ch9FunWithLists where

-- Lists, but also using Maybe
rcdHead :: [a] -> Maybe a
rcdHead [] = Nothing
rcdHead (a : _) = Just a

-- A safer version of tail
rcdTail :: [a] -> Maybe [a]
rcdTail [] = Nothing
rcdTail [_] = Nothing
rcdTail (_ : xs) = Just xs
