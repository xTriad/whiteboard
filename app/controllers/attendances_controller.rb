class AttendancesController < InheritedResources::Base

def updateAtten
  @attendance = Attendance.find(params[:id])
  if params[:atten] == "present"
        @attendance.present = true
        @attendance.absent = false
        @attendance.tardy = false
	@attendance.excused = false
  elsif params[:atten] == "absent"
        @attendance.present = false
        @attendance.absent = true
        @attendance.tardy = false
	@attendance.excused = false
  elsif params[:atten] == "tardy"
        @attendance.present = false
        @attendance.absent = false
        @attendance.tardy = true
	@attendance.excused = false
  elsif params[:atten] == "excused"
        @attendance.present = false
        @attendance.absent = false
        @attendance.tardy = false
	@attendance.excused = true
  end
@attendance.save
  respond_to do |format|
      format.json { render json: @attendance }
    end
end



# GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
    # @user_id = 123
    # @zip_file.user_id = @user.id
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
