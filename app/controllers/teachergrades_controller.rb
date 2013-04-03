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

    if @grade.save
        redirect_to teachergrades_path, :notice=>"Your Grade Saved" 
    else
        render "new" 
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
