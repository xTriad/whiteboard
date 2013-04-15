class TeachergradesController < ApplicationController
  before_filter :authenticate_user!

  def index
   @grades = AssignmentGrade.all
  end

  def show
  @grade=AssignmentGrade.find(params[:id])
   
  end

  def new
  @grade=AssignmentGrade.new

  end

  def create

  @assignment = Assignment.where(assignment_name:params[:teachergrade.aname]).first

  @grade2 = AssignmentGrade.new(params[:teachergrade])

    if @grade.save
          
    else
        render "new" 

    @grade2.save


    end

  end

  def edit

  @grade=AssignmentGrade.find(params[:id])

  end

  def update

  @grade=AssignmentGrade.find(params[:id])

    if @grade.update_attributes(params[:teachergrade])

     redirect_to teachergrades_path, :notice=>"Grade Updated" 

    else
        render "edit" 
     end
  

  end

  def destroy

  @grade = AssignmentGrade.find(params[:id])
    @grade.destroy
    redirect_to teachergrades_path, :notice=>"Grade Deleted" 
 

  end

end
