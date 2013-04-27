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

  def self.find_by_user_assignment_id(user_id, assignment_id)
    find(:first, :conditions => ['user_id = ? AND assignment_id = ?', user_id, assignment_id])
  end

  def self.find_user_grade(user_id, assignment_id)
    grade = find(:first, :conditions => ['user_id = ? AND assignment_id = ?', user_id, assignment_id])

    if grade != nil
      return grade.grade_value
    else
      return '0'
    end
  end

  def self.find_user_comment(user_id, assignment_id)
    grade = find(:first, :conditions => ['user_id = ? AND assignment_id = ?', user_id, assignment_id])

    if grade != nil
      return grade.comment
    else
      return ' '
    end
  end


  def self.find_by_user_assignment(user_id, assignment_id)
    find(:first,
      :conditions => [
        'user_id = ? AND assignment_id = ?', user_id, assignment_id
      ]
    )
  end
end
