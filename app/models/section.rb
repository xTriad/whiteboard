class Section < ActiveRecord::Base
  attr_accessible :course_id, :number
  belongs_to :course
  has_many :assignments

  # has_and_belongs_to_many :users, :join_table => :sections_users # TODO: Index this table!!!
  has_many :sections_users_roles
  has_many :roles, :through => :sections_users_roles
  has_many :users, :through => :sections_users_roles

  # Returns all users in a section in a single query, but organizes
  # them according to their role_id into a hash object.
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
        when Constants::Student_RID
          users_hash[:students] << user
        when Constants::Professor_RID
          users_hash[:professors] << user
        when Constants::TA_RID
          users_hash[:tas] << user
        when Constants::Admin_RID
          users_hash[:admins] << user
        when Constants::Observer_RID
          users_hash[:observers] << user
      end
    end

    return users_hash
  end

  # Returns all users in a section, professors, students etc.
  def self.find_users_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])
    section.users.find(:all)
  end

  def self.find_professors_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])
    section.users.find(:all, :conditions => ['role_id = ?', Constants::Professor_RID])
  end

  def self.find_tas_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])
    section.users.find(:all, :conditions => ['role_id = ?', Constants::TA_RID])
  end

  def self.find_students_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])
    section.users.find(:all, :conditions => ['role_id = ?', Constants::Student_RID])
  end

  def self.find_number_by_section_id(section_id)
    find(:first, :conditions => ['section_id = ?', section_id]).number
  end

  def self.find_course_id_by_section_id(section_id)
    find(:first, :conditions => ['section_id = ?', section_id]).course_id
  end

  def find_course_name
    # We get the "course" variable from "belongs_to :course"!
    # Pages 32-42 in Rails Antipatterns is candy
    self.course.name
  end
  
  def to_s
    "#{self.course.name} - #{self.number}"
  end
end
