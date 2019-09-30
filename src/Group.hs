module Group
    ( createPerson
    , createGroup
    , group
    ) where

import Types (Person(..), Group(..))

createPerson :: String -> Int -> Person
createPerson fName i = Person {firstName=fName, ident=i}

createGroup :: String -> [Person] -> Group
createGroup tName people = Group {teamName=tName, members=people}

group :: Int -> [a] -> [[a]]
group _ []      = [[]]
group size people
    | size <= 0 = [[]]
    | size >  p = [[]]
    | size == p = [people]
    | otherwise = split size people
        where p = length people

split :: Int -> [a] -> [[a]]
split _ []     = []
split s xs = take s xs : split s (drop s xs)
