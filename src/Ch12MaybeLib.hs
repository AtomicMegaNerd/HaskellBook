module Ch12MaybeLib where

import Data.Maybe (fromJust)

isJust :: Maybe a -> Bool
isJust (Just a) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing a = not $ isJust a

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee x f Nothing = x
mayybee x f (Just y) = f y

fromMaybe :: a -> Maybe a -> a
fromMaybe x Nothing = x
fromMaybe x (Just y) = y

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x : xs) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just n) = [n]

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Nothing : xs) = catMaybes xs
catMaybes ((Just n) : xs) = n : catMaybes xs

-- I am so happy that I figured out how to use a fold in order to
-- write this!
flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe = foldr filterForNothing (Just [])
  where
    filterForNothing :: Maybe a -> Maybe [a] -> Maybe [a]
    filterForNothing Nothing _ = Nothing
    filterForNothing _ Nothing = Nothing
    filterForNothing (Just n) acc = Just (n : fromJust acc)
