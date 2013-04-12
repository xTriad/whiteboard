class Course < ActiveRecord::Base
  attr_accessible :name, :number, :university_id
  has_many :sections

  def self.find_name_by_section_id(section_id)
    find(:first, :conditions => ['course_id = ?', Section.find_course_id_by_section_id(section_id)]).name
  end

  def self.find_by_section_id(section_id)
    find(:first, :conditions => ['course_id = ?', Section.find_course_id_by_section_id(section_id)])
  end

  def self.find_student_courses(user_id)
    courses = []

    User.find_student_sections(user_id).each do |section|
      courses << find(section.course_id)
    end

    return courses
  end

  def self.find_professor_courses(user_id)
    courses = []

    User.find_professor_sections(user_id).each do |section|
      courses << find(section.course_id)
    end

    return courses
  end
end
