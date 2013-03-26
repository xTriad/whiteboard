class Section < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :sections_users
  attr_accessible :course_id, :number
  belongs_to :course
  has_many :assignments
end
