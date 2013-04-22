class Upload < ActiveRecord::Base
  attr_accessible :upload, :assignment_id, :user_id
  has_attached_file :upload,
    :url => ":rails_root/storage/assignments/:assignment_id/:user_id/:basename.:extension", # where to retrieve
    :path => ":rails_root/storage/assignments/:assignment_id/:user_id/:basename.:extension" # where to save

  include Rails.application.routes.url_helpers

  # https://github.com/blueimp/jQuery-File-Upload/issues/365#issuecomment-13859210
  def to_jq_upload
    {
      :files => [
        {
          :name => read_attribute(:upload_file_name),
          :size => read_attribute(:upload_file_size),
          :url => upload.url(:original),
          :delete_url => upload_path(self),
          :delete_type => "DELETE"
        }
      ]
    }
  end

  # Sets the paperclip interpolation values sent in from
  # hidden form values or the URL params when a new Upload
  # object is created. This isn't needed if it already exists
  # in the database since the read_attributes(:attr_name) can
  # be used. So, these are :assignmnt_id and :user_id in the
  # has_attached_file :url and :path hashes.

  # TODO: Replace this method with the constructor?
  def paperclip_values!(assignment_id, user_id)
    @assignment_id = assignment_id
    @user_id = user_id
  end

  # This makes the Paperclip interpolation work for :assignment_id
  def assignment_id
    unless @assignment_id.nil? || @assignment_id == 0
      @assignment_id
    else
      read_attribute(:assignment_id) # TODO: Might need to cache result
    end
  end

  # This makes the Paperclip interpolation work for :user_id
  def user_id
    unless @user_id.nil? || @user_id == 0
      @user_id
    else
      read_attribute(:assignment_id) # TODO: Might need to cache result
    end
  end
end
