class Course < ActiveRecord::Base
  attr_accessible :name, :number, :university_id
  has_many :sections
end
