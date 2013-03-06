class Upload < ActiveRecord::Base
  attr_accessible :upload
  has_attached_file :upload

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

end