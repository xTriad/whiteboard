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

  # Caches query results in the has_role? method
  # Roles_Cache[user_id] = [role_id, role_id ...]
  Roles_Cache = {}

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

  # This method gets called many times on every page view so
  # it needs to cache as much as possible.
  def has_role?(role_id)
    cur_user_id = self.user_id
    has_role = false

    puts ""

    # Check if we already have the query cached
    if Roles_Cache.has_key?(cur_user_id)
      puts "\t1. Checking cache for role_id = #{role_id} in #{Roles_Cache[cur_user_id].to_s}"

      if Roles_Cache[cur_user_id].include?(role_id)
        has_role = true
        puts "\t   2. Sucessfully retrived the role from cache"
      end
    else
      the_users_roles = []

      self.roles.uniq.each do |role|
        the_users_roles << role.role_id
      end

      puts "\t1. Queried database for role_id = #{role_id} and got #{the_users_roles.to_s}"

      # Store the role array in memory
      Roles_Cache[cur_user_id] = the_users_roles

      if the_users_roles.include?(role_id)
        puts "\t   2. Successfully retrived the role from the database"
        has_role = true
      end
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
