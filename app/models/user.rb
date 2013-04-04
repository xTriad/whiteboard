class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :university_id
  
  has_and_belongs_to_many :roles, :join_table => :users_roles
  has_and_belongs_to_many :sections, :join_table => :sections_users

  belongs_to :university
  has_many :attendances # TODO: Have Kip confirm this

  def role_name
    name = ""
    Role.all.each do |role|
      if !role.users.where(:name => self.name).empty?
        name = role.name
      end
    end
    return name
  end

end
