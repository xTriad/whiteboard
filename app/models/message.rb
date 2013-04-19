class Message < ActiveRecord::Base
  attr_accessible :message, :receiver_deleted, :receiver_id, :receiver_read, :sender_deleted, :sender_id, :sent, :subject
end
