class SectionsController < ApplicationController
  before_filter :authenticate_user!

  # GET /sections
  # GET /sections.json
  def index
    authorize! :read, Section
    redirect_to courses_path
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    authorize! :read, Section
    redirect_to courses_path
  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    authorize! :create, Section
    redirect_to root
  end

  # GET /sections/1/edit
  def edit
    if !params.has_key?(:course)
      redirect_to courses_path and return
    end

    @section = Section.find(params[:id])
    authorize! :update, @section
    @course = Course.find(params[:course])
  end

  # POST /sections
  # POST /sections.json
  def create
    authorize! :create, Section
    redirect_to root
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])
    authorize! :update, @section

    respond_to do |format|
      if @section.update_attributes(params[:section])

        if params.has_key?(:course)
          @course_id = params[:course]
        else
          @course_id = Section.find_course_id_by_section_id(@section.section_id)
        end

        format.html { redirect_to course_path(@course_id, :section => @section.section_id) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    authorize! :destroy, Section
    redirect_to root
  end
end
