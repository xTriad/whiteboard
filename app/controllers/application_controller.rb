class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :date_url_format,
                :date_page_format,
                :output_user_list,
                :format_date_from_url,
                :is_student?,
                :is_professor?,
                :is_admin?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def is_student?
      return cannot? :manage, AssignmentGrade
  end

  def is_professor?
    return can? :manage, AssignmentGrade
  end

  def is_admin?
    return can? :manage, :all
  end

  # The format to store dates in the URL
  def date_url_format
    '%Y-%m-%d'
  end

  # The format to display dates on the page
  def date_page_format
    '%B %d, %Y'
  end

  def output_user_list(users)
    output = ''
    counter = users.length

    users.each do |user|
      output += user.name
      counter =- 1

      output += ' ' if counter > 0
    end

    return output
  end

  # Converts the attendance in the URL to the format used on the web page
  def format_date_from_url(date)
    DateTime.strptime(date, date_url_format).strftime(date_page_format)
  end

end
