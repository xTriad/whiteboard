class AssignmentType < ActiveRecord::Base
  attr_accessible :name
  belongs_to :assignment

  def self.find_name_by_type_id(type_id)
    find(:first, :conditions => ['type_id = ?', type_id]).name
  end

  def to_s
    self.name
  end

end
