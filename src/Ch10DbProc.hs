module Ch10DbProc where

import Data.Time
  ( UTCTime (UTCTime),
    fromGregorian,
    secondsToDiffTime,
  )

data DatabaseItem
  = DbString String
  | DbNumber Integer
  | DbDate UTCTime
  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123)),
    DbNumber 9001,
    DbString "Hello World!",
    DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123)),
    DbNumber 4216,
    DbNumber 1288
  ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate [] = []
filterDbDate (DbDate x : xs) = x : filterDbDate xs
filterDbDate (_ : xs) = filterDbDate xs

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber [] = []
filterDbNumber (DbNumber x : xs) = x : filterDbNumber xs
filterDbNumber (_ : xs) = filterDbNumber xs

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = foldr (\a b -> if a > b then a else b) (UTCTime (fromGregorian 1800 1 1) (secondsToDiffTime 0)) . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber -- Using fold here for the exercise

avgDb :: [DatabaseItem] -> Double
avgDb xs = fromIntegral (sumDb xs) / fromIntegral (length (filterDbNumber xs))
