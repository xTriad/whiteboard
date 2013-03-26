class Permission < ActiveRecord::Base
  attr_accessible :name, :role_id
  belongs_to :role
  
  def role_name
    name = ""
    Role.all.each do |role|
      if !role.permissions.where(:name => self.name).empty?
        name = role.name
      end
    end
    return name
  end
end
