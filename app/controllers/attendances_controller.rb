class AttendancesController < InheritedResources::Base
  helper_method :section_and_date_defined,
                :format_attendance_date,
                :date_url_format,
                :date_page_format,
                :output_user_list

  # May need to put these helper methods in a AttendancesHelper module in lib/
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
    if params.has_key?(:section) && params.has_key?(:date)
      return true
    else
      return false
    end
  end

  # GET /attendances
  # GET /attendances.json
  def index

    # TODO: Check if professor/admin with proper permissions

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
  # This should never be called
  def show
    @attendances = Attendance.within(24.hours.ago)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  # This should never be called
  def new
    @attendance = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  # This should never be called
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :no_content }
    end
  end
end
