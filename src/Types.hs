module Types where

data Member = Member { memberId   :: Int
                     , firstName  :: String
                     , memberOf   :: Maybe String
                     , membership :: Bool
                     } deriving (Show)

data Group = Group { groupName :: String
                   , members   :: [Member]
                   } deriving (Show)

data Community = Community { groups :: [Group]
                           } deriving (Show)
