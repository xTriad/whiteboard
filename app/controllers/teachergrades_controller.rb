class TeachergradesController < ApplicationController

  def index
   @grades = Teachergrade.all
  end

  def show
  @grade=Teachergrade.find(params[:id])
   
  end

  def new
  @grade=Teachergrade.new

  end

  def create

  @grade = Teachergrade.new(params[:teachergrade])

  @assignid = Assignments.find(params[:teachergrade.assignmentname])

  @grade2 = AssignmentGrade.new(params[:teachergrade])

    if @grade.save
          
    else
        render "new" 

    @grade2.save


    end

  end

  def edit

  @grade=Teachergrade.find(params[:id])

  end

  def update

  @grade=Teachergrade.find(params[:id])

    if @grade.update_attributes(params[:teachergrade])

     redirect_to teachergrades_path, :notice=>"Grade Updated" 

    else
        render "edit" 
     end
  

  end

  def destroy

  @grade = Teachergrade.find(params[:id])
    @grade.destroy
    redirect_to teachergrades_path, :notice=>"Grade Deleted" 
 

  end

end
