class AttendancesController < InheritedResources::Base
  before_filter :authenticate_user!

  helper_method :section_and_date_defined,
                :format_date_from_url,
                :attendance_json

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

  # Handles the AJAX call from the professor
  # attendances/sendjson?date=2013-04-14&section=1&user=1&attendance=1
  def sendjson
    authorize! :update, Attendance
    error = false

    if !params.has_key?(:section) || !params.has_key?(:date) || !params.has_key?(:user) || !params.has_key?(:attendance)
      error = true
    else
      @attendance = Attendance.find_by_user_section_date(params[:user], params[:section], params[:date])

      # Sanitize the incoming attendance
      if @attendance != nil && Constants::Attendance::List.include?(params[:attendance].to_i)
        @attendance.attendance = params[:attendance].to_i
      else
        error = true
      end
    end

    respond_to do |format|
      if !error && @attendance.save
        format.json { render json: @attendance }
      else
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
        format.html { redirect_to root_path, :notice => 'Invalid attendance parameters.' }
      end
    end
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

      # Retrieve any attendances already set in class for this day
      @date = DateTime.now
      @attendances = Attendance.in_section(params[:section]).today

      # Get an array of the student IDs that already have an attendance set
      @user_ids = []
      @attendances.each{ |attendance| @user_ids << attendance.user_id }

      # Create an attendance object for every student who doesn't already have one
      errors = { :error => false, :obj => nil }
      @students.each do |student|
        if !@user_ids.include?(student.user_id)
          new_attendance = Attendance.new({
            :user_id    => student.user_id,
            :section_id => params[:section],
            :class_date => @date,
            :attendance => Constants::Attendance::Present
          })

          if !new_attendance.save
            errors[:error] = true
            errors[:obj] = new_attendance
          end

          @attendances << new_attendance
        end
      end

      respond_to do |format|
        if !errors[:error]
          format.html # index.html.erb
          format.json { render json: @attendances }
        else
          format.json { render json: errors[:obj].errors, status: :unprocessable_entity }
          format.html { redirect_to attendances_path, :notice => 'There was an issue with loading the class attendance.'}
        end
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
