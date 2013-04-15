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

  # Main admin
  user = User.find_or_create_by_email(
    :name => ENV['ADMIN_NAME'].dup,
    :email => ENV['ADMIN_EMAIL'].dup,
    :password => ENV['ADMIN_PASSWORD'].dup,
    :password_confirmation => ENV['ADMIN_PASSWORD'].dup,
    :university_id => Constants::Uni::Baylor
  )

  # If you add any users be sure to update the constants.rb file!
  User.create([
    {
      :name => 'prof1',
      :email => 'prof1@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'prof2',
      :email => 'prof2@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'ta1',
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
      :name => 'student1',
      :email => 'student1@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'student2',
      :email => 'student2@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'student3',
      :email => 'student3@whiteboard.com',
      :password => 'password',
      :password_confirmation => 'password',
      :university_id => Constants::Uni::Baylor
    },
    {
      :name => 'student4',
      :email => 'student4@whiteboard.com',
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

  # Copy admin users to Active Admin
  adminuser = AdminUser.create!(
    :email => ENV['ADMIN_EMAIL'].dup,
    :password => ENV['ADMIN_PASSWORD'].dup,
    :password_confirmation => ENV['ADMIN_PASSWORD'].dup,
    :university_id => Constants::Uni::Baylor
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
    }
  ])

# Insert Sections: 01, 02, 03
puts 'DEFAULT SECTIONS'

  Course.all.each do |course|
    for x in 1..3
      description = 'A blank description.'

      if course.course_id == 4
        description = 'I HOPE YOU LOVE GRABOW HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA'
      end

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
      :description => 'Figure out these impossible proofs.',
      :type_id => Constants::AssignType::Homework,
      :section_id => 1,
      :due_date => '2020-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :name => 'Huffman Encoder',
      :description => 'Create a huffman encoder',
      :type_id => Constants::AssignType::Program,
      :section_id => 1,
      :due_date => '2019-02-12',
      :highest_grade_value => 100,
      :weight => 2
    },
    {
      :type_id => Constants::AssignType::Test,
      :section_id => 1,
      :due_date => '2018-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :type_id => Constants::AssignType::Homework,
      :section_id => 2,
      :due_date => '2021-02-12',
      :highest_grade_value => 100,
      :weight => 1
    },
    {
      :type_id => Constants::AssignType::Homework,
      :section_id => 2,
      :due_date => '2022-02-14',
      :highest_grade_value => 90,
      :weight => 2
    },
    {
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
    },
    {
      :section_id => 1,
      :user_id => Constants::User::Student2,
      :class_date => DateTime.now,
      :attendance => Constants::Attendance::Present
    },
    {
      :section_id => 1,
      :user_id => Constants::User::Student4,
      :class_date => DateTime.now,
      :attendance => Constants::Attendance::Absent
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