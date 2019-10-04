module Main where

import Group
import Member
import Utils

main :: IO ()
main = do
    namesData  <- readFile "data/random_names.txt"
    groupNamesData <- readFile "data/random_group_names.txt"
    let names = splitNames $ words namesData
        grpNames = lines groupNamesData
        people = zipWith (\i f -> createMember i f Nothing False) [1..] (map fst names)
        groups = zipWith createGroup grpNames (splitUp 5 people)
    print groups
