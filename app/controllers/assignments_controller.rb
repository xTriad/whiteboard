class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :display_course_sections,
                :get_user_courses,
                :get_grade_type_select_options


  def display_course_sections

  end

  def get_user_courses
    
  end

  def get_grade_type_select_options
    options = []

    AssignmentType.all.each do |type|
      options << [type.name, type.type_id]
    end

    return options
  end

  # GET /assignments/1/configs
  # Has to be plural since "config" is a predfined method
  def configs
    authorize! :update, AssignmentConfigUpload
    @assignment = Assignment.find(params[:id])
    authorize! :read, @assignment
    @course = Course.find_by_section_id(@assignment.section_id)
  end

  # GET /assignments/1/files
  def files
    authorize! :update, AssignmentUpload
    @assignment = Assignment.find(params[:id])
    authorize! :read, @assignment
    @course = Course.find_by_section_id(@assignment.section_id)
  end

  # GET /assignments
  # GET /assignments.json
  def index
    authorize! :read, Assignment

    if params.has_key?(:course)
      @course = Course.find(params[:course])

      if is_student?
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
    else
      if is_student?
        @sections = User.find_student_sections(current_user.id)
      else
        @sections = User.find_professor_sections(current_user.id)
      end

      # Find all the courses associated with the sections found
      @courses = {}
      @sections.each do |section|
        if !@courses.has_key?(section.section_id)
          @courses[section.section_id] = Course.find_by_section_id(section.section_id)
        end
      end

      # Find all assignments in each section
      @assignments = {}
      @sections.each do |section|
        @assignments[section.section_id] = {
          :course => @courses[section.section_id],
          :section => section,
          :assignments => Assignment.find_by_section_id(section.section_id)
        }
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
    @course = Course.find_by_section_id(@assignment.section_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    if !params.has_key?(:section)
      redirect_to assignments_url and return
    end

    @assignment = Assignment.new
    authorize! :create, @assignment

    @section_id = params[:section]
    @course = Course.find_by_section_id(@section_id)

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
    @course = Course.find_by_section_id(@section_id)
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])
    authorize! :create, @assignment   

    if params[:assignment].has_key?(:due_date)
      if params[:assignment][:due_date].match(/(\d{2})\/(\d{2})\/(\d{4})\s(\d{2}):(\d{2})\s(am|pm)/i)
        month, day, year, hours, minutes, ampm = $1.to_i, $2.to_i, $3.to_i, $4.to_i, $5.to_i, $6

        if ampm == 'pm'
          hours += 12
        end

        @assignment.due_date = Time.new(year, month, day, hours, minutes, 0, "-00:00")
      end
    end

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
