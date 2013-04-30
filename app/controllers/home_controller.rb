class HomeController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      if is_student?
        @course_sections = Course.find_student_courses(current_user.id)
      else
        @course_sections = Course.find_professor_courses(current_user.id)
      end
    end
  end
end
