class Section < ActiveRecord::Base
  attr_accessible :course_id, :number
  belongs_to :course
  has_many :assignments
end
