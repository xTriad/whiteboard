class Message < ActiveRecord::Base
  attr_accessible :message, :receiver_deleted, :receiver_id, :receiver_read, :sender_deleted, :sender_id, :sent, :subject

  def self.find_user_messages(user_id)
    find(:all, :conditions => ['receiver_id = ? OR sender_id = ?', user_id, user_id])
  end

  def self.find_user_sent_messages(user_id)
    # find(:all, :conditions => ['receiver_id = ? OR sender_id = ?', user_id, user_id])
  end

  def self.find_user_received_messages(user_id)
    # find(:all, :conditions => ['receiver_id = ? OR sender_id = ?', user_id, user_id])
  end
end
