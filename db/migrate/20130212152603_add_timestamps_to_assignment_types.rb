class AddTimestampsToAssignmentTypes < ActiveRecord::Migration
  def change
    add_column :assignment_types, :created_at, :datetime
    add_column :assignment_types, :updated_at, :datetime
  end
end
