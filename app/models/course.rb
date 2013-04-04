class Course < ActiveRecord::Base
  attr_accessible :name, :number, :university_id
  has_many :sections

  # TODO: Only return the courses the professor is teaching
  def self.professor_courses
    Course.all
  end
end
