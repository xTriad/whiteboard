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
  # TODO: Use INSTANCE variables to handle all permissions!
  #   Give each user a @role and even @can_do_something
  #   Then we could do current_user.can_do_this or current_user.role can ...
  #   This will allow us to query the database to see their university, section etc.
  Roles_Cache = {}

  # Finds the specific section the user is enrolled in by their
  # user_id and the given course_id
  def self.find_user_section_by_course_id(user_id, course_id)
    user = find(:first, :conditions => ['user_id = ?', user_id])
    user.sections.find(:first, :conditions => ['course_id = ?', course_id])
  end

  # Returns all sections the professor is currently teaching
  def self.find_professor_sections(user_id)
    user = find(:first, :conditions => ['user_id = ?', user_id])
    user.sections.find(:all, :conditions => ['role_id = ?', Constants::Role::Professor])
  end

  # Returns all sections the professor is currently teaching in a given course
  def self.find_professor_sections_in_course(user_id, course_id)
    user = find(:first, :conditions => ['user_id = ?', user_id])
    user.sections.find(:all, :conditions => ['role_id = ? AND course_id = ?', Constants::Role::Professor, course_id])
  end

  # Returns all sections the student is currently enrolled in
  def self.find_student_sections(user_id)
    user = find(:first, :conditions => ['user_id = ?', user_id])
    user.sections.find(:all, :conditions => ['role_id = ?', Constants::Role::Student])
  end

  def self.find_name_by_user_id(user_id)
    user = find(:first, :conditions => ['user_id = ?', user_id])

    if !user.nil?
      return user.name
    else
      return nil
    end
  end

  def self.find_id_by_email(email)
    user = find(:first, :conditions => ['email = ?', email])

    if !user.nil?
      return user.id
    else
      return nil
    end
  end

  # This method gets called many times on every page view so
  # it needs to cache as much as possible.
  def has_role?(role_id)
    cur_user_id = self.user_id
    has_role = false

    puts ""

    # Check if we already have the query cached
    if Roles_Cache.has_key?(cur_user_id)
      # puts "\t1. Checking cache for role_id = #{role_id} in #{Roles_Cache[cur_user_id].to_s}"

      if Roles_Cache[cur_user_id].include?(role_id)
        has_role = true
        # puts "\t   2. Sucessfully retrieved the role from cache"
      end
    else
      the_users_roles = []

      self.roles.uniq.each do |role|
        the_users_roles << role.role_id
      end

      # puts "\t1. Queried database for role_id = #{role_id} and got #{the_users_roles.to_s}"

      # Store the role array in memory
      Roles_Cache[cur_user_id] = the_users_roles

      if the_users_roles.include?(role_id)
        # puts "\t   2. Successfully retrieved the role from the database"
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
