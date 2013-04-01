class Upload < ActiveRecord::Base
  attr_accessible :upload
  has_attached_file :upload,
    :url => ":rails_root/storage/assignments/:assignment_id/:basename.:extension", # where to retrieve
    :path => ":rails_root/storage/assignments/:assignment_id/:basename.:extension" # where to save

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
  # hidden form tag values. So, these are :assignmnt_id and
  # :user_id in the has_attached_file :url and :path hashes
  def paperclip_values!(assignment_id)
    @assignment_id_tag = assignment_id
    #@user_id_tag = user_id
  end

  # This makes the Paperclip interpolation work for :assignment_id
  def assignment_id
    # debugger
    unless @assignment_id_tag.nil? || @assignment_id_tag == 0
      @assignment_id_tag
    else
      read_attribute(:assignment_id)
    end
  end
end