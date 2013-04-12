module Constants

  # Role IDs
  module Role
    Admin      = 1
    Professor  = 2
    TA         = 3
    Student    = 4
    Observer   = 5
  end

  # University IDs
  module Uni
    Baylor     = 1
    Texas      = 2
    Tech       = 3
  end

  # AssignmentType IDs
  module AssignType
    Homework   = 1
    Program    = 2
    Quiz       = 3
    Test       = 4
  end

  # Test account IDs
  module User
    Admin      = 1
    Professor1 = 2
    Professor2 = 3
    TA1        = 4
    TA2        = 5
    Student1   = 6
    Student2   = 7
    Student3   = 8
    Student4   = 9
    Observer1  = 10

    # Organizes the test account IDs into a hash.
    # This needs to reflect the IDs above EXACTLY.
    By_Role = {
      :admins      => [1],
      :professors  => [2,3],
      :tas         => [4,5],
      :students    => [6,7,8,9],
      :observers   => [10]
    }
  end

end