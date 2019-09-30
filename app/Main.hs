module Main where

import Group

import System.IO
import Control.Monad

main :: IO ()
main = do
        handle <- openFile "data/firstnames.txt" ReadMode
        contents <- hGetContents handle
        let names = words contents
            people = zipWith createPerson names [1..]
            groups = group 5 people
            sets = zipWith createGroup (map show [1..]) groups
        print sets
        hClose handle
