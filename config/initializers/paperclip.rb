
# http://stackoverflow.com/questions/1146848/generating-a-unique-file-path-with-polymorphic-paperclip?rq=1
# http://stackoverflow.com/questions/5613456/rails-3-paperclip-custom-interpolations
# http://viget.com/extend/paperclip-custom-interpolation
# @zip_file.user_id = @user.id in Assignment controller?

# This works if there is an assignment_id method defined in upload.rb
Paperclip.interpolates :assignment_id do |attachment, style|
  attachment.instance.assignment_id
end

Paperclip.interpolates :user_id do |attachment, style|
  attachment.instance.user_id
end

# module Paperclip
#   module Interpolations
#     def user_id(attachment, style)
#       current_user.id
#     end
#   end
# end