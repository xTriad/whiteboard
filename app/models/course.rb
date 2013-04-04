class Course < ActiveRecord::Base
  attr_accessible :name, :number, :university_id
  has_many :sections

  def self.find_name_by_section_id(section_id)
    find(:first, :conditions => ['course_id = ?', Section.find_course_id_by_section_id(section_id)]).name
  end
end
