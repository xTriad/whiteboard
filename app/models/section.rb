class Section < ActiveRecord::Base
  attr_accessible :course_id, :number
  belongs_to :course
end
