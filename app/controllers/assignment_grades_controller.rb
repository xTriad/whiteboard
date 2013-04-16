class AssignmentGradesController < ApplicationController

  def index
    authorize! :read, AssignmentGrade

    if params.has_key?(:section)

      # List all the assignments in the section
      @assignments = Assignment.find_by_section_id(params[:section])

    elsif params.has_key?(:assignment)

      # List all the users in the section for the assignment
      @assignment = Assignment.find(params[:assignment])
      @users = Section.find_students_in_section(@assignment.section_id)

    else

      # List all the courses and sections the professor is teaching
      @courses = Course.find_professor_courses(current_user.id)

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
