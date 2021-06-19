module RcdTree where

-- This is a Binary Tree in Haskell
data RCDTree a = Leaf | Node (RCDTree a) a (RCDTree a) deriving (Eq, Ord, Show)

-- #### Chapter 11 Exercises ####

-- Insert a new node into an existing tree
insert' :: Ord a => a -> RCDTree a -> RCDTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b < a = Node (insert' b left) a right
  | b > a = Node left a (insert' b right)

-- Map a function over every node in the tree
mapTree :: (a -> b) -> RCDTree a -> RCDTree b
mapTree _ Leaf = Leaf
mapTree f (Node left x right) = Node (mapTree f left) (f x) (mapTree f right)

-- This a test instance of a tree for testing
testTree :: RCDTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

-- Another test instance
testTree' :: RCDTree Integer
testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

-- A third test tree
testTree'' :: RCDTree Integer
testTree'' = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

-- This tests our implementation of mapTree
mapOkay =
  if mapTree (+ 1) testTree' == testTree''
    then print "yup OK!"
    else error "test failed"

-- Ordering functions

preorder :: RCDTree a -> [a]
preorder Leaf = []
preorder (Node left x right) = [x] ++ preorder left ++ preorder right

inorder :: RCDTree a -> [a]
inorder Leaf = []
inorder (Node left x right) = preorder left ++ [x] ++ preorder right

postorder :: RCDTree a -> [a]
postorder Leaf = []
postorder (Node left x right) = preorder left ++ preorder right ++ [x]

-- Testing our ordering functions

testInOrder :: IO ()
testInOrder =
  if inorder testTree == [1, 2, 3]
    then putStrLn "Inorder pass"
    else putStrLn "Inorder fail"

testPreorder :: IO ()
testPreorder =
  if preorder testTree == [2, 1, 3]
    then putStrLn "Preorder pass"
    else putStrLn "Preorder fail"

testPostorder :: IO ()
testPostorder =
  if postorder testTree == [1, 3, 2]
    then putStrLn "Postorder pass"
    else putStrLn "Postorder fail"

-- Doing a fold
foldTree :: (a -> b -> b) -> b -> RCDTree a -> b
foldTree f acc t = foldr f acc $ inorder t

-- This was extremely tricky... had to cheat on this one sadly
-- https://medium.com/scientific-breakthrough-of-the-afternoon/catamorphism-for-binary-trees-in-haskell-3ac4acada63b
foldTree' :: (a -> b -> b) -> b -> RCDTree a -> b
foldTree' f acc Leaf = acc
foldTree' f acc (Node left x right) = foldTree' f (f x (foldTree' f acc left)) right

-- #### Chapter 12 Exercises ####

unfold :: (a -> Maybe (a, b, a)) -> a -> RCDTree b
unfold = undefined

treeBuild :: Integer -> RCDTree Integer
treeBuild = unfold (\a -> Just (a - 1, a, a - 1))
