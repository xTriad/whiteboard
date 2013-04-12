class SectionsController < ApplicationController
  before_filter :authenticate_user!

  # GET /sections
  # GET /sections.json
  def index
    authorize! :read, Section
    @sections = Section.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @section = Section.find(params[:id])
    authorize! :read, @section

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    authorize! :create, Section
    redirect_to sections_path
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
    authorize! :update, @section
    redirect_to @section
  end

  # POST /sections
  # POST /sections.json
  def create
    authorize! :create, Section
    redirect_to sections_path
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    authorize! :update, Section
    redirect_to sections_path
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    authorize! :destroy, Section
    redirect_to sections_path
  end
end
