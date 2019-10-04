module Community
    ( isGroupNameTaken
    , findGroupNamed
    , whichGroupHasMemberId
    , whichGroupHasMemberNamed
    ) where

import Types (Group(..))
import Group

isGroupNameTaken :: String -> [Group] -> Bool
isGroupNameTaken gName groups =
    case findGroupNamed gName groups of
        Nothing   -> False
        otherwise -> True

findGroupNamed :: String -> [Group] -> Maybe Group
findGroupNamed _ []       = Nothing
findGroupNamed gName (g:gs)
    | gName == groupName g = Just g
    | otherwise            = findGroupNamed gName gs

whichGroupHasMemberId :: Int -> [Group] -> String
whichGroupHasMemberId _ [] = "None"
whichGroupHasMemberId memberId (g:gs) =
    case findMemberById memberId $ members g of
        Nothing     -> whichGroupHasMemberId memberId gs
        Just member -> groupName g

whichGroupHasMemberNamed :: String -> [Group] -> String
whichGroupHasMemberNamed _ [] = "None"
whichGroupHasMemberNamed firstName (g:gs) =
    case findMemberByFirstName firstName $ members g of
        Nothing     -> whichGroupHasMemberNamed firstName gs
        Just member -> groupName g
