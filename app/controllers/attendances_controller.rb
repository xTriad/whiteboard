class AttendancesController < InheritedResources::Base
  before_filter :authenticate_user!

  helper_method :section_and_date_defined,
                :format_date_from_url,
                :date_url_format,
                :date_page_format,
                :output_user_list,
                :attendance_json

  # May need to put these helper methods in a AttendancesHelper module in app/helpers/
  # if there start to be too many. See page 21 in Rails Antipatterns.

  # The format to store dates in the URL
  def date_url_format
    '%Y-%m-%d'
  end

  # The format to display dates on the page
  def date_page_format
    '%B %d %Y'
  end

  def output_user_list(users)
    output = ''

    users.each do |user|
      output += user.name + ' '
    end

    return output
  end

  def update_attendance
    @attendance = Attendance.find(params[:id])
    @attendance.set_attendance(params[:atten])
    @attendance.save

    respond_to do |format|
      format.json { render json: @attendance }
    end
  end

  # Converts the attendance in the URL to the format used on the web page
  def format_date_from_url(date)
    DateTime.strptime(date, date_url_format).strftime(date_page_format)
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
      json << "user_name: \""  << User.find(attendance.user_id).name << "\", "
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
    json << "  students: [\n"

    @students.each do |student|
      json << "    { "
      json << "user_name: \"" << student.name.to_s << "\", "
      json << "user_id: "     << student.user_id.to_s
      json << " }"

      counter -= 1

      if(counter > 0)
        json << ",\n"
      end
    end

    json << "\n  ],"
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
