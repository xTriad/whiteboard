# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

# Insert Courses
puts 'DEFAULT COURSES'
Course.create([
  :number => 2000,
  :name => 'Data Structures'
])

# Insert Sections: 01, 02, 03 ...
puts 'DEFAULT SECTIONS'
Section.create([
  :course_id => 1,
  :number => 1
])

#Insert Assignment Types: Homework, Quiz, Program, Test ...
puts 'DEFAULT ASSIGNMENT TYPES'
AssignmentType.create([
  name: 'Homework'
])

# Insert Assignments
puts 'DEFAULT ASSIGNMENTS'
Assignment.create([
  :type_id => 1,
  :section_id => 1,
  :due_date => '2020-02-12',
  :highest_grade_value => 100,
  :weight => 1
])