class Role < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  has_many :permissions

  # has_and_belongs_to_many :users, :join_table => :users_roles
  has_many :sections_users_roles
  has_many :sections, :through => :sections_users_roles
  has_many :users, :through => :sections_users_roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :created_at, :updated_at
  
  scopify
end
