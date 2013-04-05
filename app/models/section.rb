class Section < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :sections_users_roles # TODO: Index this table!!!
  attr_accessible :course_id, :number
  belongs_to :course
  has_many :assignments

  # TODO: Only return the sections the professor is teaching
  def self.professor_sections(professor_user_id)
    all
  end

  # TODO: Get Kip to help with this
  def self.find_users_in_section(section_id)
    section = find(:first, :conditions => ['section_id = ?', section_id])

    # Rails expects user_id, not ur_id
    # Need to join users_roles as well to get user_id and role_id
    section.users.find(:all, :conditions => ['ur_id = ?', 1])

    # http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_and_belongs_to_many
    # The join table should not have a primary key or a model associated with it...yet users_roles has one

    # joins(:users).where(:users => { :category => 'public' })
    # joins(:users).where('users.ur_id' => 'public' )
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
end
