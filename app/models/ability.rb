class Ability
  include CanCan::Ability

  # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  # http://railscasts.com/episodes/192-authorization-with-cancan
  # http://www.tonyamoyal.com/2010/07/28/rails-authentication-with-devise-and-cancan-customizing-devise-controllers/
  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? Constants::Admin_RID
      can :manage, :all
    elsif user.has_role? Constants::Professor_RID
      can :manage, [Assignment, Attendance, Teachergrade, Upload]
      can :read, [Course, Grade, Section]
    elsif user.has_role? Constants::TA_RID
      can :manage, [Upload, Teachergrade]
      can :read, [Assignment, Course, Grade, Section]
    elsif user.has_role? Constants::Student_RID
      can :manage, [Upload]
      can :read, [Assignment, Course, Grade, Section]
    else
      # Observer
    end
  end
end