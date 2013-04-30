class SectionsUsersRole < ActiveRecord::Base
  attr_accessible :section_id, :user_id, :role_id

  belongs_to :section
  belongs_to :user
  belongs_to :role

  #accepts_nested_attributes_for :course
  
  def find_course
    Course.find(:first, :conditions => ['course_id = ?', Section.find_course_id_by_section_id(section.section_id)])
  end
  
  def find_section_number
    Section.find_number_by_section_id(section.section_id)
  end
  
end
