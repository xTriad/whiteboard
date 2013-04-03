class AddUserIdToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :user_id, :integer # TODO: Not null and foreign key
    add_column :uploads, :assignment_id, :integer # TODO: Not null and foreign key
  end
end
