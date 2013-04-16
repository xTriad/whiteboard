class AttendancesController < InheritedResources::Base
  before_filter :authenticate_user!

  helper_method :section_and_date_defined,
                :format_date_from_url,
                :attendance_json

  # Handles the AJAX JSON submit call from the professor
  # attendances/sendjson?date=2013-04-14&section=1
  def sendjson

    if !params.has_key?(:section) || !params.has_key?(:date)
      redirect_to sendjson_attendances_path and return
    end

    # debugger
    # data = ActiveSupport::JSON.decode(params["_json"])
    data = params[:attendance]
    debugger

    # @attendance = Attendance.find(params[:id])
    # @attendance.set_attendance(params[:atten])
    # @attendance.save

    # respond_to do |format|
    #   format.json { render json: @attendance }
    # end

    redirect_to sendjson_attendances_path and return
  end

  def section_and_date_defined
    return params.has_key?(:section) && params.has_key?(:date)
  end

  # This assumes the index controller action has been called and
  # has initialized @attendances.
  def attendance_json
    counter = @attendances.length
    json =  "section_id: "   << params[:section] << ",\n"
    json << "  class_date: \"" << params[:date] << "\",\n"
    json << "  attendance: {\n"

    # Print out the attendances already set for this section on this date
    @attendances.each do |attendance|
      json << "    \"" << attendance.user_id.to_s << "\": { "
      json << "attendance: "   << attendance.attendance.to_s
      json << " }"

      counter -= 1

      if(counter > 0)
        json << ",\n"
      end
    end

    json << "\n  },\n"
    # End attendances

    # All the students in this section
    counter = @students.length
    json << "  students: {\n"

    @students.each do |student|
      json << "    \"" << student.user_id.to_s << "\": { "
      json << "user_name: \"" << student.name.to_s << "\""
      json << " }"

      counter -= 1

      if(counter > 0)
        json << ",\n"
      end
    end

    json << "\n  },"
    # End students

    return json
  end

  # GET /attendances
  # GET /attendances.json
  def index
    authorize! :read, Attendance

    if section_and_date_defined

      # Show the students in the section for the given day
      @professors = Section.find_professors_in_section(params[:section])
      @tas = Section.find_tas_in_section(params[:section])
      @students = Section.find_students_in_section(params[:section])

      # Any attendances already set in class for this day
      # TODO: Make this since midnight rather than 24 hours ago
      @attendances = Attendance.in_section(params[:section]).within(24.hours.ago)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @attendances }
      end

    elsif

      # Show all the sections the professor is currently teaching
      @professor_sections = User.find_professor_sections(current_user.id)

      respond_to do |format|
        format.html # index.html.erb
      end
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    authorize! :read, Attendance
    redirect_to attendances_path
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    authorize! :create, Attendance
    redirect_to attendances_path
  end

  # GET /attendances/1/edit
  def edit
    authorize! :update, Attendance
    redirect_to attendances_path
  end

  # POST /attendances
  # POST /attendances.json
  def create
    authorize! :create, Attendance
    redirect_to attendances_path
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    authorize! :update, Attendance
    redirect_to attendances_path
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    authorize! :destroy, Attendance
    redirect_to attendances_path
  end
end
