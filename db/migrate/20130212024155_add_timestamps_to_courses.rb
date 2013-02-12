class AddTimestampsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :created_at, :datetime
    add_column :courses, :updated_at, :datetime
  end
end
