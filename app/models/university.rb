class University < ActiveRecord::Base
  attr_accessible :university_name
  has_many :users

  def to_s
    self.university_name
  end

end
