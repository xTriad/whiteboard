# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

# Insert Universities
puts 'DEFAULT UNIVERSITIES'
University.create([
  { :university_name => 'Baylor' },
  { :university_name => 'Texas' },
  { :university_name => 'A&M' }
])

# Insert Roles
puts 'DEFAULT ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

# Insert Default Users
puts 'DEFAULT USERS'
user = User.find_or_create_by_email(
  :name => ENV['ADMIN_NAME'].dup,
  :email => ENV['ADMIN_EMAIL'].dup,
  :password => ENV['ADMIN_PASSWORD'].dup,
  :password_confirmation => ENV['ADMIN_PASSWORD'].dup,
  :university_id => 1
)

puts 'user: ' << user.name
user.add_role :admin

# Copy Users to Active Admin
adminuser = AdminUser.create!(
  :email => ENV['ADMIN_EMAIL'].dup,
  :password => ENV['ADMIN_PASSWORD'].dup,
  :password_confirmation => ENV['ADMIN_PASSWORD'].dup,
  # :admin => true,
  :university_id => 1
)

# Insert Courses
puts 'DEFAULT COURSES'
Course.create([
  {
    :number => 1430,
    :university_id => 1,
    :name => 'Introduction I'
  },
  {
    :number => 1440,
    :university_id => 1,
    :name => 'Introduction II'
  },
  {
    :number => 2334,
    :university_id => 1,
    :name => 'Introduction to Systems'
  },
  {
    :number => 3101,
    :university_id => 1,
    :name => 'Computer Ethics'
  },
  {
    :number => 3344,
    :university_id => 1,
    :name => 'Data Structures'
  },
  {
    :number => 3335,
    :university_id => 1,
    :name => 'Database'
  },
  {
    :number => 4321,
    :university_id => 1,
    :name => 'Computer Networking'
  },
  {
    :number => 4330,
    :university_id => 1,
    :name => 'Foundations'
  }
])

# Insert Sections: 01, 02, 03 ...
puts 'DEFAULT SECTIONS'
Course.all.each do |course|
  for x in 1..3
    Section.create(:course_id => course.course_id, :number => x);
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
    :type_id => 1,
    :section_id => 1,
    :due_date => '2020-02-12',
    :highest_grade_value => 100,
    :weight => 1
  },
  {
    :type_id => 1,
    :section_id => 2,
    :due_date => '2020-02-14',
    :highest_grade_value => 90,
    :weight => 2
  }
])