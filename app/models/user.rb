class User < ActiveRecord::Base
  rolify

  # Setup selected Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :university_id

  has_many :sections_users_roles
  has_many :sections, :through => :sections_users_roles
  has_many :roles, :through => :sections_users_roles

  has_many :attendances
  belongs_to :university

  # Returns all sections the professor is currently teaching
  def self.find_professor_sections(user_id)
    user = find(:first, :conditions => ['user_id = ?', user_id])
    user.sections.find(:all, :conditions => ['role_id = ?', Constants::Role::Professor])
  end

  # Returns all sections the student is currently enrolled in
  def self.find_student_sections(user_id)
    user = find(:first, :conditions => ['user_id = ?', user_id])
    user.sections.find(:all, :conditions => ['role_id = ?', Constants::Role::Student])
  end

  def self.find_name_by_user_id(user_id)
    find(:first, :conditions => ['user_id = ?', user_id]).name
  end

  # TODO: This method gets called a ton of times, need to cache these queries
  def has_role?(role_id)
    has_role = false
    da_roles = []

    # TODO: Just get unique values efficiently if possible
    self.roles.find(:all).each do |current_role|
      da_roles << current_role.role_id
      has_role = true if role_id == current_role.role_id
    end

    # So I can see in the terminal for testing purposes
    da_roles.each do |role_id|
      puts "#{role_id} "
    end

    return has_role
  end

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
