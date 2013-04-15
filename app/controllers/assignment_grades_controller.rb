class AssignmentGradesController < ApplicationController

  def index

    if !params.has_key?(:section)
      @courses = Course.find_professor_courses(current_user.id)
    else
      # @grades = AssignmentGrade.find_grades_by_section_id(params[:section])
      @assignments = Assignment.find_by_section_id(params[:section])
    end
  end

  def show
  @assignment_grade=AssignmentGrade.find(params[:id])
   
  end

  def new
  @assignment_grade=AssignmentGrade.new

  end

  def create
 
  # @assignment=Assignment.where(:assignment_id => params[:assignment_grade][:assignment_id]).first
  @assignmentid=@assignment[:assignment_id] 

  @user=User.where(:name => params[:assignment_grade][:user_name]).first
  @userid=@user[:user_id]

 @grade2 = AssignmentGrade.new
 @grade2.assignment_id=@assignmentid
 @grade2.user_id=@userid
 @grade2.grade_value=params[:assignment_grade][:grade_value]
 @grade2.assignment_name=params[:assignment_grade][:assignment_name]
 @grade2.user_name=params[:assignment_grade][:user_name]
 @grade2.comment=params[:assignment_grade][:comment]

    if @grade2.save
        redirect_to assignment_grades_path, :notice=>"Your Grade Saved" 
    else
        render "new" 
    end

  end

  def edit

  @assignment_grade=AssignmentGrade.find(params[:id])

  end

  def update

  @assignment_grade=AssignmentGrade.find(params[:id])

    if @assignment_grade.update_attributes(params[:assignment_grade])

     redirect_to assignment_grade_path, :notice=>"Grade Updated" 

    else
        render "edit" 
     end
  

  end

  def destroy

  @assignment_grade = AssignmentGrade.find(params[:id])
    @assignment_grade.destroy
    redirect_to assignment_grade_path, :notice=>"Grade Deleted" 
 

  end

end
