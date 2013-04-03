class University < ActiveRecord::Base
  attr_accessible :university_name
  has_many :users
end
