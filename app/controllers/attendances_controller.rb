class AttendancesController < InheritedResources::Base
  before_filter :authenticate_user!

  helper_method :section_and_date_defined,
                :format_attendance_date,
                :date_url_format,
                :date_page_format,
                :output_user_list

  # May need to put these helper methods in a AttendancesHelper module in app/helpers/
  # if there start to be too many. See page 21 in Rails Antipatterns.

  # The format to store dates in the URL
  def date_url_format
    '%d-%m-%Y'
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

  def format_attendance_date(date)
    DateTime.strptime(date, date_url_format).strftime(date_page_format)
  end

  def section_and_date_defined
    return params.has_key?(:section) && params.has_key?(:date)
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
