class Course < ActiveRecord::Base
  attr_accessible :name, :number
  has_many :sections
end
