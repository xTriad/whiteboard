class CoursesController < ApplicationController
  include Helpers

  before_filter :authenticate_user!
  helper_method :display_courses

=begin
  def display_courses
    output = '<table cellspacing="5" cellpadding="5" style="background-color: #fff;">'
    @counter = 0

    @courses.each do |course|
      if @counter == 0
        output += '<tr>'
      end

      output += '<td style="background-color: #ff00ff;">'
        output += '<div class="mainListItem">#{course.number} &nbsp; #{course.name}</div>'
        output += '<div class="subListItem">'
          output +=  '<a href="' + assignments_path(:course => course.course_id) + '">Assignments</a>,'
          output += '&nbsp;'
          output += '<a href="adsfasdf">Course Information</a>,'
        output += '</div>'
      output += '</td>'

      if @counter == 2
        output += '</tr>'
        @counter = -1
      end

      @counter += 1
     end

   output += '</table>'

   return output.html_safe
  end
=end
  # GET /courses
  # GET /courses.json
  def index
    authorize! :read, Course

    if cannot? :manage, Teachergrade
      @courses = Course.find_student_courses(current_user.id)
    else
      @courses = Course.find_professor_courses(current_user.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    authorize! :read, @course

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    authorize! :create, Course
    redirect_to courses_path
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    authorize! :update, @course
    redirect_to @course
  end

  # POST /courses
  # POST /courses.json
  def create
    authorize! :create, Course
    redirect_to courses_path
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    authorize! :update, Course
    redirect_to courses_path
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    authorize! :destroy, Course
    redirect_to courses_path
  end
end
