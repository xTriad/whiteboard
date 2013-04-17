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

  # Attendance IDs
  module Attendance
    Present    = 1
    Absent     = 2
    Tardy      = 3
    Excused    = 4

    # This needs to match the above values EXACTLY
    List       = [1,2,3,4]
  end

  # Test account IDs
  module User

    # Baylor
    Admin1     = 1
    Professor1 = 2
    Professor2 = 3
    TA1        = 4
    TA2        = 5
    Student1   = 6
    Student2   = 7
    Student3   = 8
    Student4   = 9
    Student5   = 10
    Student6   = 11
    Student7   = 12
    Student8   = 13
    Student9   = 14
    Student10  = 15
    Student11  = 16
    Student12  = 17
    Student13  = 18
    Student14  = 19
    Observer1  = 20

    # Texas
    Admin2     = 21
    Professor3 = 22
    Professor4 = 23
    Student15  = 24
    Student16  = 25
    Student17  = 26

    # Organizes the test account IDs into a hash.
    # This needs to reflect the IDs above EXACTLY.
    By_Role = {
      :admins      => [1,21],
      :professors  => [2,3,22,23],
      :tas         => [4,5],
      :students    => [6,7,8,9,10,11,12,13,14,15,16,17,18,19,24,25,26],
      :observers   => [20]
    }
  end

end