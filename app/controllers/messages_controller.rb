class MessagesController < InheritedResources::Base

  # GET /messages
  # GET /messages.json
  def index
    authorize! :read, Message
    @messages = Message.find_user_conversations(current_user.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    authorize! :read, Message
    @messages = Message.find_conversation(params[:id])

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

    # If this is a reply to an already created convo
    if params.has_key?(:reply)
      @first_convo_message = Message.find(params[:reply])
      @reply_to = @first_convo_message.message_id
      @first_convo_message.subject = 'Re: ' + @first_convo_message.subject

      # Figure out who the receiver is in this conversation. If
      # only one person then it's ourself, otherwise we need to
      # query for a distinct list of convo participants and grab
      # the one whose id does not match our own.
      @participant_ids = [@first_convo_message.sender_id, @first_convo_message.receiver_id]

      # Assume it's the same person replying to themselves, although
      # this is probably not true and will be corrected below if so
      @receiver_id = @participant_ids.first

      # Find the person we are replying to
      @participant_ids.each do |user_id|
        if user_id != current_user.id
          @receiver_id = user_id
          break
        end
      end
    end

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
    @message.date_sent = DateTime.now

    if params.has_key?(:appointment_timestamp)
      if params[:appointment_timestamp].match(/(\d{2})\/(\d{2})\/(\d{4})\s(\d{2}):(\d{2})\s(am|pm)/i)
        month, day, year, hours, minutes, ampm = $1.to_i, $2.to_i, $3.to_i, $4.to_i, $5.to_i, $6.to_i

        if ampm == 'pm'
          hours += 12
        end

        @message.appointment_timestamp = Time.new(year, month, day, hours, minutes, 0)
      end
    end

    error = '';
    is_reply = false

    if params[:message].has_key?(:receiver_id)
      is_reply = true
    end

    if @message.subject.length < 1 || @message.message.length < 1
      error = 'You must have a subject and a message.'
    else
      @receiver_id = nil

      if params[:message].has_key?(:receiver_id)
        @receiver_id = params[:message][:receiver_id]
      else
        @receiver_id = User.find_id_by_email(params[:receiver_email])
      end

      if !@receiver_id.nil?
        @message.receiver_id = @receiver_id
      else
        error = 'The user with the email address "' + params[:receiver_email] + '" does not exist.'
      end
    end

    respond_to do |format|
      if !@receiver_id.nil? && @message.save
        if is_reply
          format.html { redirect_to message_path(@message.reply_to) }
        else
          format.html { redirect_to @message }
        end
      else
        flash[:error] = error

        if is_reply
          @first_convo_message = Message.new(params[:message])
          @reply_to = @first_convo_message.reply_to
          @receiver_id = params[:message][:receiver_id]
        end

        format.html { render action: "new" }
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
