class UploadsController < ApplicationController
  before_filter :authenticate_user!

  # GET /uploads
  # GET /uploads.json
  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'

    # TODO: Only retrieve uploads for the given user's assignment
    # Add user_id and assginment_id fields to the uploads table
    @uploads = Upload.where(:assignment_id => params[:assignment_id])

    @uploads.each do |upload|
      upload.paperclip_values!(params[:assignment_id]) # TODO: Debug and see if this is needed
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads.map{|upload| upload.to_jq_upload } }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])
    @upload.paperclip_values!(params[:assignment_id]) # TODO: Debug and see if this is needed

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    debugger # TODO: This isn't getting called when a new upload occurs, it's happening in the javascript via ajax
    @upload = Upload.new # TODO: Create constructor that accepts ids
    @upload.paperclip_values!(params[:assignment_id]) # TODO: Debug and see if this is needed

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
    @upload.paperclip_values!(params[:assignment_id]) # TODO: Debug and see if this is needed
  end

  # POST /uploads
  # POST /uploads.json
  def create
    debugger
    temp = params[:assignment_id] # this doesn't exist for this action!
    @upload = Upload.new(params[:upload]) # TODO: Create constructor that accepts ids
    @upload.paperclip_values!(params[:assignment_id]) # TODO: This isn't happening, needs to happen in javascript on uploads/x/new?

    respond_to do |format|
      if @upload.save
        format.html {
          render :json => @upload.to_jq_upload.to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: @upload.to_jq_upload.to_json, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])
    @upload.paperclip_values!(params[:assignment_id]) # TODO: Debug and see if this is needed

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    # TODO: Javascript usage: http://railsapps.github.com/rails-javascript-include-external.html
    @upload = Upload.find(params[:id])
    @upload.paperclip_values!(params[:assignment_id]) # TODO: Debug and see if this is needed
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
