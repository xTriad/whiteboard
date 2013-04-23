class Assignment < ActiveRecord::Base
  attr_accessible :due_date, :name, :description, :highest_grade_value, :section_id, :type_id, :weight
  belongs_to :section

  # Return all assignments in the given course section
  def self.find_by_section_id(section_id)
    where(:section_id => section_id)
  end

  # Return all assignments in all the course sections
  def self.find_all_by_course_id(course_id)
    sections = Section.find_all_by_course_id
    where("section_id in (?)", sections)
  end

  def get_type_name
    AssignmentType.find_name_by_type_id(self.type_id)
  end

  def get_name
    (self.name != nil) ? self.name : 'Unnamed'
  end

  def get_description
    (self.description != nil && self.description.match(/\S/)) ? self.description : 'No description.'
  end

end
