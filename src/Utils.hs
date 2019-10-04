module Utils
    ( splitUp
    , splitNames
    ) where

splitUp :: Int -> [a] -> [[a]]
splitUp _ []    = []
splitUp n xs
    | n > 0     = take n xs : splitUp n (drop n xs)
    | otherwise = []

splitNames :: [String] -> [(String, String)]
splitNames []          = []
splitNames (f:l:names) = (f,l) : splitNames names
