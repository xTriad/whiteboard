class AssignmentGrade < ActiveRecord::Base
  attr_accessible :grade_id, :calculated, :assignment_id, :user_id, :grade_value, :comment
  belongs_to :section

  def self.find_grades_by_section_id(section_id)
    assignments_ids = []

    Assignment.find_by_section_id(section_id).each do |assignment|
      assignments_ids << assignment.assignment_id
    end

    where('assignment_id in (?)', assignments_ids)
  end
end
