module Group
    ( createGroup
    , findMemberById
    , findMemberByFirstName
    , addMemberToGroup
    , removeMemberFromGroup
    ) where

import Types (Member(..), Group(..))
import Member

createGroup :: String -> [Member] -> Group
createGroup groupName people = Group {groupName=groupName, members=newMembers}
    where newMembers = map (\p -> updateMembership p (Just groupName) True) people

findMemberById :: Int -> [Member] -> Maybe Member
findMemberById _ []    = Nothing
findMemberById i (m:ms)
    | i == memberId m  = Just m
    | otherwise        = findMemberById i ms

findMemberByFirstName :: String -> [Member] -> Maybe Member
findMemberByFirstName _ [] = Nothing
findMemberByFirstName name (m:ms)
    | name == firstName m  = Just m
    | otherwise            = findMemberByFirstName name ms

addMemberToGroup :: Member -> Group -> Group
addMemberToGroup member group = createGroup sameGrpName (newMember:groupMembers)
    where sameGrpName  = groupName group
          newMember    = updateMembership member (Just sameGrpName) True
          groupMembers = members group

removeMemberFromGroup :: Member -> Group -> Group
removeMemberFromGroup member group = createGroup sameGrpName updatedMembers
    where updatedMembers = filter (\m -> memberId m /= memberId member) (members group)
          sameGrpName    = groupName group
