{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Data.List
import System.Environment ( getArgs )
import Debug.Trace


identAscHeadLen :: [Int] -> Int
identAscHeadLen = iAL 1
    where
        iAL :: Int -> [Int] -> Int
        iAL i list
            | i > 9 = 9
            | list !! i > list !! (i-1) = iAL (i+1) list
            | otherwise = i

findSmallestLargerNum :: [Int] -> Int -> Int
findSmallestLargerNum = fSLN 0
    where
        fSLN :: Int -> [Int] -> Int -> Int
        fSLN _ [] _ = error "this method cannot be called for an empty list"
        fSLN j list i
            | list !! j > x = j
            | list !! j <= x = fSLN (j+1) list i
            where
                x = list !! i

swap :: [Int] -> Int -> Int -> [Int]
swap list i j = swap' [] (length list - 1) list i j
    where
        swap' :: [Int] -> Int -> [Int] -> Int -> Int -> [Int]
        swap' nList a list i j
            | a < 0 = trace (show nList) $ nList
            | a == i = swap' (list !! i: (list !! j : nList)) (a-1) list i j
            | a == j = swap' nList (a-1) list i j
            | otherwise = swap' (list !! a : nList) (a-1) list i j


findNextPerm :: [Int] -> [Int]
findNextPerm perm = swap perm i j
    where
        i = identAscHeadLen perm
        j = findSmallestLargerNum perm i

repeat' :: [Int] -> Int -> [Int]
repeat' perm i
    | i == 0 = perm
    | otherwise = (repeat' (findNextPerm perm) (i-1))
        

rev :: [Int] -> [Int]
rev = reverse

main = do
    args <- getArgs
    let init = rev [0,1,2,3,4,5,6,7,8,9]
    let limit = 1000000
    print init
    print $ rev $ repeat' init limit