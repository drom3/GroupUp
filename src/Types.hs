module Types where

data Person = Person { firstName :: String
                     , ident     :: Int
                     } deriving (Show)

data Group = Group { teamName  :: String
                    , members  :: [Person]
                    } deriving (Show)
