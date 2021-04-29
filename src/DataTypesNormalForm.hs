module DataTypesNormalForm where

type AuthorName = String

-- This is not in normal form
{-
data Fiction = Fiction deriving (Show)
data NonFiction = NonFiction deriving (Show)
data BookType = FictionBook Fiction | NonFictionBook NonFiction deriving (Show)
data Author = Author (AuthorName, BookType)
-}

-- This is in normal form, and is equivalent to the code that is commented out above.
data Author' = Fiction AuthorName | NonFiction AuthorName deriving (Eq, Show)

-- Now for an exercise

type Gardener = String

{-
data FlowerType = Gardenia | Daisy | Rose | Lilac deriving Show
data Garden = Garden Gardener FlowerType deriving Show
-}

-- Put this into sume of products normal form
data Garden = Gardenia Gardener | Daisy Gardener | Rose Gardener | Lilac Gardener deriving (Show)
