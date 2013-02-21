class Upload < ActiveRecord::Base
  attr_accessible :description, :file, :title
  mount_uploader :file, FileUploader
end
