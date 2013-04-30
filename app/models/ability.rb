class Ability
  include CanCan::Ability

  # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  # http://railscasts.com/episodes/192-authorization-with-cancan
  # http://www.tonyamoyal.com/2010/07/28/rails-authentication-with-devise-and-cancan-customizing-devise-controllers/
  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? Constants::Role::Admin
      can :manage, :all
      # can :manage, User, User.where(:university_id => user.university_id)
    elsif user.has_role? Constants::Role::Professor
      can :manage, [Assignment, Attendance, Section, AssignmentGrade, AssignmentUpload, AssignmentConfigUpload, Message]
      can :read, [Course]
    elsif user.has_role? Constants::Role::TA
      can :manage, [AssignmentUpload, AssignmentGrade, Message]
      can :read, [Assignment, Course, Section]
    elsif user.has_role? Constants::Role::Student
      can :manage, [AssignmentUpload, Message]
      can :read, [Assignment, Course, Section, AssignmentGrade]

      # http://stackoverflow.com/questions/10748529/creating-a-where-query-in-rails-from-an-array
      # A user should only be able to view courses they are enrolled in
      # can :read, Course do |course|
      #   # course.try(:user) == user
      # end
      # can :read, Course, Course.where('course_id in (?)', course_ids) do |course|
      #   product.discontinued?
      # end

      # can :write, Forum, :id => Forum.with_role(:moderator, user).map(&:id)
    else
      can :manage, []
      can :read, []
    end
  end
end
