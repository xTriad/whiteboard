class Message < ActiveRecord::Base
  attr_accessible :message, :date_sent, :reply_to, :receiver_deleted, :receiver_id, :receiver_read, :sender_deleted, :sender_id, :sent, :subject

  def self.find_user_messages(user_id)
    find(:all, :conditions => ['receiver_id = ? OR sender_id = ?', user_id, user_id])
  end

  # Same as find_user_messages but only returns the first message of each convo
  def self.find_user_conversations(user_id)
    find(:all, :conditions => ['reply_to is NULL AND (receiver_id = ? OR sender_id = ?)', user_id, user_id], :order => "date_sent DESC")
  end

  # Finds all the messages that are in reply to the starting message including
  # the starting message, and orders by date
  def self.find_conversation(message_id)
    find(:all, :conditions => ['reply_to = ? OR message_id = ?', message_id, message_id], :order => "date_sent ASC")
  end

  # Find all the users in the conversation
  def self.find_convo_user_ids(message_id)
    # messages = select("DISTINCT ON (sender_id, receiver_id) *").find(:all, :conditions => ['reply_to = ? OR message_id = ?', message_id, message_id])
    first_message = find(:first, :conditions => ['message_id = ?', message_id])
    users = [first_message.sender_id, first_message.receiver_id]
  end

end
