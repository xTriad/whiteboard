class Assignment < ActiveRecord::Base
  attr_accessible :due_date, :highest_grade_value, :section_id, :type_id, :weight
  belongs_to :section
end