class AssignmentGrade < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :Integer, :Integer, :grade_id, :calculated, :assignment_id, :user_id, :grade_value, :Integer, :boolean, :float, :text, :assignment_name, :text, :user_name, :text,:comment
end
