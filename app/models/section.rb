class Section < ActiveRecord::Base
  attr_accessible :course_id, :number, :description

  has_many :sections_users_roles
  has_many :roles, :through => :sections_users_roles
  has_many :users, :through => :sections_users_roles

  has_many :assignments
  has_many :assignment_grades
  belongs_to :course

  # Return all sections in the given course
  def self.find_all_by_course_id(course_id)
    where("course_id = ?", course_id)
  end

  # Returns all users in a section, professors, students etc.
  def self.find_users_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])
    section.users.find(:all)
  end

  def self.find_professors_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])
    section.users.find(:all, :conditions => ['role_id = ?', Constants::Role::Professor])
  end

  def self.find_tas_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])
    section.users.find(:all, :conditions => ['role_id = ?', Constants::Role::TA])
  end

  def self.find_students_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])
    section.users.find(:all, :conditions => ['role_id = ?', Constants::Role::Student])
  end

  def self.find_number_by_section_id(section_id)
    find(:first, :conditions => ['section_id = ?', section_id]).number
  end

  def self.find_course_id_by_section_id(section_id)
    find(:first, :conditions => ['section_id = ?', section_id]).course_id
  end

  def find_course_name
    self.course.name
  end

  # Returns all users in a section in a single query, but organizes
  # them according to their role_id into a hash object. THIS IS
  # CURRENTLY BROKEN.
  def self.find_users_in_section_hashed(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])

    users_hash = {
      :admins => [],
      :professors => [],
      :tas => [],
      :students => [],
      :observers => []
    }

    # TODO: Need to be able to return users and their role_id in a
    # a single query which we can then iterate through
    section.users.find(:all).each do |user|
      role_id = nil

      case role_id
        when Constants::Role::Student
          users_hash[:students] << user
        when Constants::Role::Professor
          users_hash[:professors] << user
        when Constants::Role::TA
          users_hash[:tas] << user
        when Constants::Role::Admin
          users_hash[:admins] << user
        when Constants::Role::Observer
          users_hash[:observers] << user
      end
    end

    return users_hash
  end

  def to_s
    "#{self.course.name} - #{self.number}"
  end
end
