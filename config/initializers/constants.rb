# Role IDs
Admin_RID      = 1
Professor_RID  = 2
TA_RID         = 3
Student_RID    = 4
Observer_RID   = 5

# University IDs
Baylor         = 1
Texas          = 2
Tech           = 3

# AssignmentType IDs
Homework       = 1
Program        = 2
Quiz           = 3
Test           = 4

# Test account IDs
Admin_UID      = 1
Professor1_UID = 2
Professor2_UID = 3
TA1_UID        = 4
TA2_UID        = 5
Student1_UID   = 6
Student2_UID   = 7
Student3_UID   = 8

# Organize the Test Account IDs into a hash
# This needs to reflect the IDs above EXACTLY
Test_Users = {
  :admins      => [1],
  :professors  => [2,3],
  :tas         => [4,5],
  :students    => [6,7,8],
  :observers   => []
}