class SectionsUsersRole < ActiveRecord::Base
  attr_accessible :section, :user, :role

  belongs_to :section
  belongs_to :user
  belongs_to :role
end
