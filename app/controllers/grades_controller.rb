class GradesController < ApplicationController
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

  @grade = AssignmentGrade.new(params[:grade])

    if @grade.save
        redirect_to grades_path, :notice=>"Your Grade Saved" 
    else
        render "new" 
    end

  end

  def edit

  @grade=AssignmentGrade.find(params[:id])

  end

  def update

  @grade=AssignmentGrade.find(params[:id])

    if @grade.update_attributes(params[:grade])

     redirect_to grades_path, :notice=>"Your Grade Updated" 

    else
        render "edit" 
     end
  

  end

  def destroy

  @grade = AssignmentGrade.find(params[:id])
    @grade.destroy
    redirect_to grades_path, :notice=>"Your Post Terminated" 
 

  end
end
