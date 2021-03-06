class AssignmentGradesController < ApplicationController
  before_filter :authenticate_user!

   # Handles the AJAX call from the professor
  # attendances/alter?date=2013-04-14&section=1&user=1&attendance=1
  def alter
    authorize! :update, AssignmentGrade
    error = false

    if !params.has_key?(:grade) || !params.has_key?(:userid) || !params.has_key?(:assignment)
      error = true
  
    else
      @agrade = AssignmentGrade.find_by_user_assignment(params[:userid], params[:assignment])

      if(!@agrade)
          @agrade = AssignmentGrade.new();
          @agrade.user_id = params[:userid]
          @agrade.assignment_id=params[:assignment]
      else
      end
      @agrade.grade_value=params[:grade]
      @agrade.comment=params[:comment]

      # Sanitize the incoming grade - check grade value
      #if @attendance != nil && Constants::Attendance::List.include?(params[:attendance].to_i)
        #@attendance.attendance = params[:attendance].to_i
      #else
        #error = true
      #end
    end

    if(@agrade!=nil)
	    respond_to do |format|
	      if @agrade.save
		 format.html {redirect_to assignment_grades_path(:assignment => params[:assignment])}
	      else
		format.html { redirect_to alter_assignment_grades, :notice => 'Invalid grade parameters.' }
	      end
	    end
    else
        redirect_to assignment_grades_path and return
    end
  end

  def index

    if is_professor?

	    if params.has_key?(:section)

	      # List all the assignments in the section
	      @assignments = Assignment.find_by_section_id(params[:section])
	      @course = Course.find_by_section_id(params[:section])
	      @section_id = params[:section]

	    elsif params.has_key?(:assignment)

	      # List all the users in the section for the assignment
	      @assignment = Assignment.find(params[:assignment])
	      @users = Section.find_students_in_section(@assignment.section_id)
	      @course = Course.find_by_section_id(@assignment.section_id)
	      @section_id = @assignment.section_id

	    else

	      # List all the courses and sections the professor is teaching
	      @courses = Course.find_professor_courses(current_user.id)

	    end

   else if is_student?

	    if params.has_key?(:section)

	      # List all the assignments in the section
	      @assignments = Assignment.find_by_section_id(params[:section])
	      @course = Course.find_by_section_id(params[:section])
	      @section_id = params[:section]
              @grades = AssignmentGrade.find_grades_by_section_id(params[:section])

	    else

	      # List all the courses and sections the student is in
	      @courses = Course.find_student_courses(current_user.id)

	    end
       end

   end


  end

  def show
    @assignment_grade = AssignmentGrade.find(params[:id])
    authorize! :read, @assignment_grade
  end

  def new
    authorize! :create, AssignmentGrade

    if !params.has_key?(:user) || !params.has_key?(:assignment)
      redirect_to assignment_grades_path and return
    end

    @assignment_grade = AssignmentGrade.new
    @user_id = params[:user]
    @assignment_id = params[:assignment]
    @assignment = Assignment.find(@assignment_id)
    @course = Course.find_by_section_id(@assignment.section_id)
    @section_id = @assignment.section_id
  end

  def create
    @assignment_grade = AssignmentGrade.new(params[:assignment_grade])
    authorize! :create, @assignment_grade

    respond_to do |format|
      if @assignment_grade.save
        format.html { redirect_to assignment_grades_path(:assignment => params[:assignment_grade][:assignment_id]) }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @assignment_grade = AssignmentGrade.find(params[:id])
    authorize! :update, @assignment_grade

    @user_id = @assignment_grade.user_id
    @assignment_id = @assignment_grade.assignment_id
    @assignment = Assignment.find(@assignment_id)
    @course = Course.find_by_section_id(@assignment.section_id)
    @section_id = @assignment.section_id
  end

  def update
    @assignment_grade = AssignmentGrade.find(params[:id])
    authorize! :update, @assignment_grade

    respond_to do |format|
      if @assignment_grade.update_attributes(params[:assignment_grade])
        format.html { redirect_to assignment_grades_path(:assignment => params[:assignment_grade][:assignment_id]) }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @assignment_grade = AssignmentGrade.find(params[:id])
    authorize! :destroy, @assignment_grade
    @assignment_grade.destroy

    respond_to do |format|
      format.html { redirect_to assignment_grades_path }
      format.json { head :no_content }
    end
  end
end
