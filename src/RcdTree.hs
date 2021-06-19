module RcdTree where

data RCDTree a = Leaf | Node (RCDTree a) a (RCDTree a) deriving (Eq, Ord, Show)

insert' :: Ord a => a -> RCDTree a -> RCDTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b < a = Node (insert' b left) a right
  | b > a = Node left a (insert' b right)

mapTree :: (a -> b) -> RCDTree a -> RCDTree b
mapTree _ Leaf = Leaf
mapTree f (Node left x right) = Node (mapTree f left) (f x) (mapTree f right)

testTree' :: RCDTree Integer
testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected :: RCDTree Integer
mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

mapOkay =
  if mapTree (+ 1) testTree' == mapExpected
    then print "yup OK!"
    else error "test failed"

preorder :: RCDTree a -> [a]
preorder Leaf = []
preorder (Node left x right) = [x] ++ preorder left ++ preorder right

inorder :: RCDTree a -> [a]
inorder Leaf = []
inorder (Node left x right) = preorder left ++ [x] ++ preorder right

postorder :: RCDTree a -> [a]
postorder Leaf = []
postorder (Node left x right) = preorder left ++ preorder right ++ [x]

testTree :: RCDTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

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

-- Just for reference here is the definition of foldr for lists
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f acc [] = acc
foldr' f acc (x:xs) = f x (foldr f acc xs)

-- Now let's try implementing it for an RCDTree
foldTree' :: (a -> b -> b) -> b -> RCDTree a -> b
foldTree' f acc Leaf = acc
foldTree' f acc (Node left x right) = Node (foldTree' f acc left) (f x) (foldTree' f acc right)
