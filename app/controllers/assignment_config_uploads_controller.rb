class AssignmentConfigUploadsController < ApplicationController
  before_filter :authenticate_user!

  # GET /uploads
  # GET /uploads.json
  def index
    authorize! :read, AssignmentConfigUpload

    if !params.has_key?(:assignment_id)
      redirect_to root_path and return # TODO: Render error page instead
    end

    @uploads = AssignmentConfigUpload.where(:assignment_id => params[:assignment_id])

    respond_to do |format|
      format.json { render json: @uploads.map{|upload| upload.to_jq_upload } }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    authorize! :read, AssignmentConfigUpload
    redirect_to root_path
  end

  # GET /uploads/new
  # GET /uploads/new.json
  # This should never be called since the jquery-fileupload Javascript ajax
  # handles the creation of new Uploads.
  def new
    authorize! :create, AssignmentConfigUpload
    redirect_to root_path
  end

  # GET /uploads/1/edit
  def edit
    authorize! :update, AssignmentConfigUpload
    redirect_to root_path
  end

  # POST /uploads
  # POST /uploads.json
  # This method is called from the jquery-fileupload Javascript, not
  # from the new page/action above.
  def create
    @upload = AssignmentConfigUpload.new(params[:assignment_config_upload])
    authorize! :create, @upload

    # Note that although these params are from the URL, they are also
    # being passed through the params[:upload] POST variable since the
    # database columns "user_id" and "assignment_id" won't get filled in
    # without the POST variables for some reason. The POST variables are
    # accessed like the following: params[:upload][:field_name]
    @upload.paperclip_values!(params[:assignment_id])

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
    authorize! :update, AssignmentConfigUpload
    redirect_to root_path
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    # TODO: Javascript usage: http://railsapps.github.com/rails-javascript-include-external.html
    @upload = AssignmentConfigUpload.find(params[:id])
    authorize! :destroy, @upload
    @upload.paperclip_values!(@upload.read_attribute(:assignment_id), @upload.read_attribute(:user_id))
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to assignment_uploads_url }
      format.json { head :no_content }
    end
  end
end
