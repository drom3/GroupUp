module Member
    ( createMember
    , updateMembership
    , resetMembership
    ) where

import Types (Member(..))

createMember :: Int -> String -> Maybe String -> Bool -> Member
createMember memId fstName grpName hasGroup = Member { memberId=memId
                                                     , firstName=fstName
                                                     , memberOf=grpName
                                                     , membership=hasGroup
                                                     }

updateMembership :: Member -> Maybe String -> Bool -> Member
updateMembership member grpName grpStatus = createMember sameId sameFstName grpName grpStatus
    where sameId      = memberId member
          sameFstName = firstName member

resetMembership :: Member -> Member
resetMembership member = createMember sameId sameFstName Nothing False
    where sameId      = memberId member
          sameFstName = firstName member
