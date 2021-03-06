# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

# Very useful post: http://stackoverflow.com/a/10302357
# Tip: Use rake db:reset to drop the database, re-create it, and run this seeds file
#   Note that this may not retain some foreign key restraints for some reason

# Insert Universities
puts 'DEFAULT UNIVERSITIES'

  University.create([
    { :university_name => 'Baylor' },
    { :university_name => 'Texas' },
    { :university_name => 'Tech' }
  ])

# Insert Roles
puts 'DEFAULT ROLES'

  YAML.load(ENV['ROLES']).each do |role|
    Role.find_or_create_by_name({ :name => role }, :without_protection => true)
    puts 'role: ' << role
  end

# Insert Users
puts 'DEFAULT USERS'

  # If you add any users be sure to update the constants.rb file!

  # Main admin for Baylor
  User.find_or_create_by_email(
    :name => ENV['ADMIN1_NAME'].dup,
    :email => ENV['ADMIN1_EMAIL'].dup,
    :password => ENV['ADMIN1_PASSWORD'].dup,
    :password_confirmation => ENV['ADMIN1_PASSWORD'].dup,
    :university_id => Constants::Uni::Baylor
  )

  # Baylor
  User.create([
    {
      :name => 'James Howard',
      :email => 'prof1@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Cody Sampson',
      :email => 'prof2@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Garrett Benoit',
      :email => 'ta1@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'ta2',
      :email => 'ta2@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Lebron James',
      :email => 'student1@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Rasbhard Lewis',
      :email => 'student2@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Chris Bosh',
      :email => 'student3@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Shane Battier',
      :email => 'student4@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Mario Chalmers',
      :email => 'student5@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Norris Cole',
      :email => 'student6@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Dwayne Wade',
      :email => 'student7@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Mike Miller',
      :email => 'student8@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Ray Allen',
      :email => 'student9@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'James Jones',
      :email => 'student10@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Chris Anderson',
      :email => 'student11@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'student12',
      :email => 'student12@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'Joel Anthony',
      :email => 'student13@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'student14',
      :email => 'student14@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'observer1',
      :email => 'observer1@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    }
  ])

  # Main admin for Texas
  User.find_or_create_by_email(
    :name => ENV['ADMIN2_NAME'].dup,
    :email => ENV['ADMIN2_EMAIL'].dup,
    :password => ENV['ADMIN2_PASSWORD'].dup,
    :password_confirmation => ENV['ADMIN2_PASSWORD'].dup,
    :university_id => Constants::Uni::Texas
  )

  # Texas
  User.create([
    {
      :name => 'William Powers',
      :email => 'prof3@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Texas
    },
    {
      :name => 'prof4',
      :email => 'prof4@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Texas
    },
    {
      :name => 'Kevin Durant',
      :email => 'student15@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Texas
    },
    {
      :name => 'student16',
      :email => 'student16@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Texas
    },
    {
      :name => 'student17',
      :email => 'student17@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Texas
    }
  ])

  # Copy admin users to Active Admin
  AdminUser.create!(
    :email => ENV['ADMIN1_EMAIL'].dup,
    :password => ENV['ADMIN1_PASSWORD'].dup,
    :password_confirmation => ENV['ADMIN1_PASSWORD'].dup,
    :university_id => Constants::Uni::Baylor
  )

  AdminUser.create!(
    :email => ENV['ADMIN2_EMAIL'].dup,
    :password => ENV['ADMIN2_PASSWORD'].dup,
    :password_confirmation => ENV['ADMIN2_PASSWORD'].dup,
    :university_id => Constants::Uni::Texas
  )

# Insert Courses
puts 'DEFAULT COURSES'

  Course.create([
    {
      :number => 1430,
      :university_id => Constants::Uni::Baylor,
      :name => 'Introduction I'
    },
    {
      :number => 1440,
      :university_id => Constants::Uni::Baylor,
      :name => 'Introduction II'
    },
    {
      :number => 2334,
      :university_id => Constants::Uni::Baylor,
      :name => 'Introduction to Systems'
    },
    {
      :number => 3101,
      :university_id => Constants::Uni::Baylor,
      :name => 'Computer Ethics'
    },
    {
      :number => 1337,
      :university_id => Constants::Uni::Baylor,
      :name => 'Volleyball'
    },
    {
      :number => 3344,
      :university_id => Constants::Uni::Baylor,
      :name => 'Data Structures'
    },
    {
      :number => 3335,
      :university_id => Constants::Uni::Baylor,
      :name => 'Database'
    },
    {
      :number => 4321,
      :university_id => Constants::Uni::Baylor,
      :name => 'Computer Networking'
    },
    {
      :number => 4330,
      :university_id => Constants::Uni::Baylor,
      :name => 'Foundations'
    },
    {
      :number => 1234,
      :university_id => Constants::Uni::Texas,
      :name => 'How to be a Hipster'
    },
    {
      :number => 4321,
      :university_id => Constants::Uni::Texas,
      :name => 'Cooking Lessons'
    }
  ])

# Insert Sections: 01, 02, 03
puts 'DEFAULT SECTIONS'

  Course.all.each do |course|
    for x in 1..3
      description = 'The course description.<br /><br />In tincidunt semper libero nec vestibulum. Cras consectetur hendrerit purus, ornare volutpat felis volutpat ac. Nulla tempus dolor sed erat feugiat vel egestas augue viverra. Suspendisse potenti. Suspendisse sed lorem mauris, pellentesque molestie diam. Proin sodales sapien at magna gravida interdum vel et magna. Vestibulum tincidunt tellus id sapien fermentum eget lobortis est blandit.'
      Section.create(:course_id => course.course_id, :number => x, :description => description);
    end
  end

# Insert Assignment Types
puts 'DEFAULT ASSIGNMENT TYPES'

  AssignmentType.create([
    { :name => 'Homework' },
    { :name => 'Program' },
    { :name => 'Quiz' },
    { :name => 'Test' }
  ])

# Insert Assignments
puts 'DEFAULT ASSIGNMENTS'

  Assignment.create([
    {
      :name => 'Proofs',
      :description => 'Solve these proofs.',
      :type_id => Constants::AssignType::Homework,
      :section_id => 1,
      :due_date => '2020-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Huffman Encoder',
      :description => 'Create a Huffman Encoder application capable of compressing and decompressing files.',
      :type_id => Constants::AssignType::Program,
      :section_id => 1,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Test 1',
      :type_id => Constants::AssignType::Test,
      :section_id => 1,
      :due_date => '2018-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Homework 1',
      :type_id => Constants::AssignType::Homework,
      :section_id => 2,
      :due_date => '2021-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Homework 2',
      :type_id => Constants::AssignType::Homework,
      :section_id => 2,
      :due_date => '2022-02-14',
      :highest_grade_value => 90,
      :weight => 1
    },
    {
      :name => 'AVL Tree',
      :type_id => Constants::AssignType::Program,
      :section_id => 2,
      :due_date => '2023-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :type_id => Constants::AssignType::Test,
      :section_id => 2,
      :due_date => '2024-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Tetris',
      :description => 'Create the Tetris game using the SDL library.',
      :type_id => Constants::AssignType::Program,
      :section_id => 3,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Huffman Encoder',
      :description => 'Create a Huffman Encoder application capable of compressing and decompressing files.',
      :type_id => Constants::AssignType::Program,
      :section_id => 3,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Tic Tac Toe',
      :description => 'Create the Tic Tac Toe game using the SDL library.',
      :type_id => Constants::AssignType::Program,
      :section_id => 3,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Tetris',
      :description => 'Create the Tetris game using the SDL library.',
      :type_id => Constants::AssignType::Program,
      :section_id => 4,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Huffman Encoder',
      :description => 'Create a Huffman Encoder application capable of compressing and decompressing files.',
      :type_id => Constants::AssignType::Program,
      :section_id => 4,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Hello World',
      :description => 'Write a simple hello world C++ program.',
      :type_id => Constants::AssignType::Program,
      :section_id => 4,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Tetris',
      :description => 'Create the Tetris game using the SDL library.',
      :type_id => Constants::AssignType::Program,
      :section_id => 5,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Huffman Encoder',
      :description => 'Create a Huffman Encoder application capable of compressing and decompressing files.',
      :type_id => Constants::AssignType::Program,
      :section_id => 5,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Tic Tac Toe',
      :description => 'Create the Tic Tac Toe game using the SDL library.',
      :type_id => Constants::AssignType::Program,
      :section_id => 5,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Intro To Being a Hipster',
      :description => 'Teaches one how to dress and act like a hipster.',
      :type_id => Constants::AssignType::Homework,
      :section_id => 28,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Intro To Being a Hipster',
      :description => 'Teaches one how to dress and act like a hipster.',
      :type_id => Constants::AssignType::Homework,
      :section_id => 29,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 1
    }
  ])

# Insert Attendances
puts 'DEFAULT ATTENDANCES'

  Attendance.create([
    {
      :section_id => 1,
      :user_id => Constants::User::Student2,
      :class_date => DateTime.new(2013,4,1),
      :attendance => Constants::Attendance::Present
    },
    {
      :section_id => 1,
      :user_id => Constants::User::Student4,
      :class_date => DateTime.new(2013,4,1),
      :attendance => Constants::Attendance::Present
    }
  ])

# Insert Messages
puts 'DEFAULT MESSAGES'

  Message.create([
    {
      :sender_id => Constants::User::Professor1,
      :receiver_id => Constants::User::Professor2,
      :sent => true,
      :subject => 'A Private Message',
      :message => 'Ut sit amet turpis at sem viverra tempus. Ut libero dolor, bibendum et laoreet id, faucibus vel orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam posuere fringilla sapien, vitae adipiscing dui dictum eget.<br /><br />Nulla nisl dolor, luctus et bibendum quis, suscipit nec eros. Aenean ac ante mollis massa tincidunt tempus nec et lacus. Ut lectus dui, sagittis id porttitor ut, bibendum non massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu tellus mi. Aenean ullamcorper.',
      :receiver_read => false,
      :sender_deleted => false,
      :receiver_deleted => false,
      :date_sent => DateTime.now
    },
    {
      :sender_id => Constants::User::Professor2,
      :receiver_id => Constants::User::Professor1,
      :sent => true,
      :subject => 'Re: A Private Message',
      :message => 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dignissim purus eu felis semper eleifend. Ut venenatis elit at.',
      :receiver_read => false,
      :sender_deleted => false,
      :receiver_deleted => false,
      :date_sent => DateTime.now,
      :reply_to => 1
    },
    {
      :sender_id => Constants::User::Professor1,
      :receiver_id => Constants::User::Professor2,
      :sent => true,
      :subject => 'Re: A Private Message',
      :message => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu dolor ac dui vulputate nullam.',
      :receiver_read => false,
      :sender_deleted => false,
      :receiver_deleted => false,
      :date_sent => DateTime.now,
      :reply_to => 1
    },
    {
      :sender_id => Constants::User::Professor1,
      :receiver_id => Constants::User::Professor2,
      :sent => true,
      :subject => 'Hello',
      :message => 'Hello there...<br /><br />The End.',
      :receiver_read => false,
      :sender_deleted => false,
      :receiver_deleted => false,
      :date_sent => DateTime.now
    }
  ])

# Populate sections_users_roles. This puts users with odd IDs into
# sections with odd IDs and vice versa. It does this for each user
# type as well, so each section will have professors, students, etc.
puts 'Populating SECTIONS_USERS_ROLES'

  # Keep student from being placed into two sections of the same course
  # student_courses[student_id] = [course_id, course_id, ...]
  student_courses = {}
  User.find(:all).each do |user|
    student_courses[user.user_id] = []
  end

  sections        = Section.find(:all)
  admin_role      = Role.find(Constants::Role::Admin)
  professor_role  = Role.find(Constants::Role::Professor)
  ta_role         = Role.find(Constants::Role::TA)
  student_role    = Role.find(Constants::Role::Student)
  observer_role   = Role.find(Constants::Role::Observer)

  Constants::User::By_Role.each do |role_name, role|
    role.each do |user_id|
      user_id_oddity = (user_id % 2 == 0) ? 1 : 0

      sections.each do |section|
        section_id_oddity = (section.section_id % 2 == 0) ? 1 : 0

        # If both even or both odd
        if user_id_oddity == section_id_oddity

          user = User.find(user_id)

          # Make sure the user and the section belong to the same university
          course = Course.find_by_section_id(section.section_id)
          next if user.university_id != course.university_id

          role_object = nil

          case role_name

            when :students
              role_object = student_role

              # Skip this 'each' iteration if the user is already in the course in another section
              next if student_courses[user.user_id].include?(section.course_id)

              # Add the course to the list of courses the student it taking
              student_courses[user.user_id] << section.course_id

            when :professors
              role_object = professor_role

            when :tas
              role_object = ta_role

            when :admins
              role_object = admin_role

            when :observers
              role_object = observer_role
          end

          user.sections_users_roles << SectionsUsersRole.new(:section => section, :role => role_object)
        end
      end
    end
  end