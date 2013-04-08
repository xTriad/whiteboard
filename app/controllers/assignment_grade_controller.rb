class AssignmentGradeController < ApplicationController

  def index
   @grades = AssignmentGrades.all
  end

  def show
  @grade=AssignmentGrades.find(params[:id])
   
  end

  def new
  @grade=AssignmentGrades.new

  end

  def create

  @grade = AssignmentGrades.new(params[:teachergrade])

    if @grade.save
          
    else
        render "new" 


    end

  end

  def edit

  @grade=AssignmentGrades.find(params[:id])

  end

  def update

  @grade=AssignmentGrades.find(params[:id])

    if @grade.update_attributes(params[:teachergrade])

     redirect_to teachergrades_path, :notice=>"Grade Updated" 

    else
        render "edit" 
     end
  

  end

  def destroy

  @grade = AssignmentGrades.find(params[:id])
    @grade.destroy
    redirect_to teachergrades_path, :notice=>"Grade Deleted" 
 

  end

end
