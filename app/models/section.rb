class Section < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :sections_users
  attr_accessible :course_id, :number
  belongs_to :course
  has_many :assignments

  # TODO: Only return the sections the professor is teaching
  def self.professor_sections(professor_user_id)
    all
  end

  def self.find_number_by_section_id(section_id)
    find(:first, :conditions => ['section_id = ?', section_id]).number
  end

  def self.find_course_id_by_section_id(section_id)
    find(:first, :conditions => ['section_id = ?', section_id]).course_id
  end

  def find_course_name
    # We get the "course" variable from "belongs_to :course"!
    # Pages 32-42 in Rails Antipatterns is candy
    self.course.name
  end
end
