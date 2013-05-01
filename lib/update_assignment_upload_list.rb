puts "Executing update_assignment_upload_list.rb"

file_name = "filename"
content_type = "content-type"
file_size = 120
created_at = DateTime.now
updated_at = DateTime.now
user_id = 6
assignment_id = 11

query = "INSERT INTO assignment_uploads (file_name, content_type, file_size, created_at, updated_at, user_id, assignment_id) VALUES (#{file_name}, #{content_type}, #{file_size}, #{created_at}, #{updated_at}, #{user_id}, #{assignment_id})"

ActiveRecord::Base.connection.execute(query);