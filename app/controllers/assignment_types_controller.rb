class AssignmentTypesController < ApplicationController
  # GET /assignment_types
  # GET /assignment_types.json
  def index
    @assignment_types = AssignmentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignment_types }
    end
  end

  # GET /assignment_types/1
  # GET /assignment_types/1.json
  def show
    @assignment_type = AssignmentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment_type }
    end
  end

  # GET /assignment_types/new
  # GET /assignment_types/new.json
  def new
    @assignment_type = AssignmentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment_type }
    end
  end

  # GET /assignment_types/1/edit
  def edit
    @assignment_type = AssignmentType.find(params[:id])
  end

  # POST /assignment_types
  # POST /assignment_types.json
  def create
    @assignment_type = AssignmentType.new(params[:assignment_type])

    respond_to do |format|
      if @assignment_type.save
        format.html { redirect_to @assignment_type, notice: 'Assignment type was successfully created.' }
        format.json { render json: @assignment_type, status: :created, location: @assignment_type }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignment_types/1
  # PUT /assignment_types/1.json
  def update
    @assignment_type = AssignmentType.find(params[:id])

    respond_to do |format|
      if @assignment_type.update_attributes(params[:assignment_type])
        format.html { redirect_to @assignment_type, notice: 'Assignment type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_types/1
  # DELETE /assignment_types/1.json
  def destroy
    @assignment_type = AssignmentType.find(params[:id])
    @assignment_type.destroy

    respond_to do |format|
      format.html { redirect_to assignment_types_url }
      format.json { head :no_content }
    end
  end
end
