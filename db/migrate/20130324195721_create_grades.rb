class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :string
      t.string :name
      t.string :Integer
      t.string :grade
      t.string :Integer
      t.string :pointsposs
      t.string :string
      t.string :comment

      t.timestamps
    end
  end
end
