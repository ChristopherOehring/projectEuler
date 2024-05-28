--A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

-- A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

-- As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
import Data.Set (Set)
import qualified Data.Set as Set

upperBound = 28123

sumProperDivisors :: Int -> Int
sumProperDivisors x =
    sumProperDivisors_ x 1 0

sumProperDivisors_ :: Int -> Int -> Int -> Int
sumProperDivisors_ x i sum =
    if i <= div x 2
    then sumProperDivisors_ x (i + 1) (new_sum)
    else sum
    where new_sum = (if (mod x i) == 0 then sum + i else sum)

isAbundantNumber :: Int -> Bool
isAbundantNumber x = sumProperDivisors x > x

listAbundantNumbers i list = if i < upperBound then listAbundantNumbers (i + 1) (newList) else list
    where newList = if isAbundantNumber i then (i:list) else list

canBeSumOfTwoAbundant _ [] _ = False
canBeSumOfTwoAbundant i (x:listOfAbundant) setOfAbundant = if Set.member (i - x) setOfAbundant then True else canBeSumOfTwoAbundant i listOfAbundant setOfAbundant

totalSum 28123 sum _ _ = sum
totalSum i sum listOfAbundant setOfAbundant = totalSum (i + 1) newSum listOfAbundant setOfAbundant
    where newSum = if canBeSumOfTwoAbundant i listOfAbundant setOfAbundant then sum else sum + i

main = do
    let listOfAbundant = listAbundantNumbers 1 []
    let setOfAbundant = Set.fromDistinctDescList listOfAbundant
    print $ totalSum 0 0 listOfAbundant setOfAbundant