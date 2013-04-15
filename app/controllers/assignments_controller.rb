class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :course_defined?,
                :display_course_sections,
                :get_user_courses

  def course_defined?
    return params.has_key?(:course)
  end

  def display_course_sections

  end

  def get_user_courses
    
  end

  # GET /assignments/1/files
  def files
    authorize! :update, Upload
  end

  # GET /assignments
  # GET /assignments.json
  def index
    authorize! :read, Assignment

    if course_defined?
      @course = Course.find(params[:course])

      if cannot? :manage, AssignmentGrade
        @section = User.find_user_section_by_course_id(current_user.id, @course.course_id)
        @assignments = Assignment.find_by_section_id(@section.section_id)
      else
        @prof_sections = User.find_professor_sections_in_course(current_user.id, @course.course_id)
        @assignments = {}

        @prof_sections.each do |section|
          @assignments[section.section_id] = {
            :section => section,
            :assignments => Assignment.find_by_section_id(section.section_id)
          }
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])
    authorize! :read, @assignment

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @assignment = Assignment.new
    authorize! :create, @assignment

    @section_id = params[:section]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
    authorize! :update, @assignment
    @section_id = @assignment.section_id
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])
    authorize! :create, @assignment    

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created, location: @assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])
    authorize! :update, @assignment

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])
    authorize! :destroy, @assignment
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end
end
