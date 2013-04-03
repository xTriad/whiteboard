class UploadsController < ApplicationController
  before_filter :authenticate_user!

  # GET /uploads
  # GET /uploads.json
  def index
    # authorize! :index, @user, :message => 'Not authorized as an administrator.''
    @uploads = Upload.where(:assignment_id => params[:assignment_id], :user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads.map{|upload| upload.to_jq_upload } }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  # This isn't being called since the jquery-fileupload Javascript ajax
  # handles the creation of new Uploads.
  def new
    @upload = Upload.new
    @upload.paperclip_values!(params[:assignment_id], params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  # This method is called from the jquery-fileupload Javascript, not
  # from the new page/action above.
  def create
    @upload = Upload.new(params[:upload])

    # Note that although these params are from the URL, they are also
    # being passed through the params[:upload] POST variable since the
    # database columns "user_id" and "assignment_id" won't get filled in
    # without the POST variables for some reason. The POST variables are
    # accessed like the following: params[:upload][:field_name]
    @upload.paperclip_values!(params[:assignment_id], params[:user_id])

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
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
