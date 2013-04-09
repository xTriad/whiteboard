class Role < ActiveRecord::Base
  has_many :sections_users_roles
  has_many :sections, :through => :sections_users_roles
  has_many :users, :through => :sections_users_roles

  has_many :permissions
  belongs_to :resource, :polymorphic => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :created_at, :updated_at

  scopify
end
