class MessagesController < InheritedResources::Base

  # GET /messages
  # GET /messages.json
  def index
    authorize! :read, Message
    @messages = Message.find_user_messages(current_user.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    authorize! :read, @message

    @is_sender = (@message.sender_id == current_user.id) ? true : false
    @receiver_name = User.find_name_by_user_id(@message.receiver_id)
    @sender_name = User.find_name_by_user_id(@message.sender_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    authorize! :create, @message

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    authorize! :update, Message
    redirect_to messages_path
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    authorize! :create, @message   

    @message.receiver_id = User.find_id_by_email(params[:receiver_email])

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PUT /messages/1
  # # PUT /messages/1.json
  def update
    authorize! :update, Message
    redirect_to messages_path
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    authorize! :destroy, @message

    if current_user.id == @message.sender_id
      @message.sender_deleted = true
    else
      @message.receiver_deleted = true
    end

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
