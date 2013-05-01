class AssignmentUpload < ActiveRecord::Base
  attr_accessible :assignment_upload, :assignment_id, :user_id
  has_attached_file :assignment_upload,
    :url => "/assignment_uploads/download?assignment=:assignment_id&user=:user_id&name=:basename.:extension", # how to retrieve
    :path => ":rails_root/storage/assignments/:assignment_id/:user_id/:basename.:extension" # where to save

  include Rails.application.routes.url_helpers

  # https://github.com/blueimp/jQuery-File-Upload/issues/365#issuecomment-13859210
  def to_jq_upload
    {
      :files => [
        {
          :name => assignment_upload_file_name(),
          :size => assignment_upload_file_size(),
          :url => assignment_upload.url(:original).gsub("%3F", "?"),
          :delete_url => assignment_upload_path(self),
          :delete_type => "DELETE"
        }
      ]
    }
  end

  # Rather than renaming the database column "file_name" to
  # "assignment_upload_file_name" which paperclip expects, I've
  # defined these methods instead.
  def assignment_upload_file_name
    read_attribute(:file_name)
  end

  def assignment_upload_file_name=(value)
    write_attribute(:file_name, value)
  end

  def assignment_upload_file_size
    read_attribute(:file_size)
  end

  def assignment_upload_file_size=(value)
    write_attribute(:file_size, value)
  end

  def assignment_upload_content_type
    read_attribute(:content_type)
  end

  def assignment_upload_content_type=(value)
    write_attribute(:content_type, value)
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
      read_attribute(:user_id) # TODO: Might need to cache result
    end
  end
end
