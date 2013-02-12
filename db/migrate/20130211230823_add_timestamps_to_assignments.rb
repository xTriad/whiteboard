class AddTimestampsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :created_at, :datetime
    add_column :assignments, :updated_at, :datetime
  end
end
