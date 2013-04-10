class AssignmentsController < ApplicationController
  before_filter :authenticate_user!

  # GET /assignments
  # GET /assignments.json
  def index
    authorize! :read, Assignment
    @assignments = Assignment.all

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
    authorize! :create, Assignment
    redirect_to assignments_path
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
    authorize! :update, Upload # This is intentional
  end

  # POST /assignments
  # POST /assignments.json
  def create
    authorize! :create, Assignment
    redirect_to assignments_path
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    authorize! :update, Assignment
    redirect_to assignments_path
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    authorize! :destroy, Assignment
    redirect_to assignments_path
  end
end
