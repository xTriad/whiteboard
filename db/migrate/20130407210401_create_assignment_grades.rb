class CreateAssignmentGrades < ActiveRecord::Migration
  def change
    create_table :assignment_grades do |t|

      t.timestamps
    end
  end
end
