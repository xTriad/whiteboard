class CreateTeachergrades < ActiveRecord::Migration
  def change
    create_table :teachergrades do |t|
      t.string :string
      t.string :aname
      t.string :string
      t.string :sname
      t.string :Integer
      t.string :points
      t.string :Integer
      t.string :pointsposs
      t.string :string
      t.string :comment

      t.timestamps
    end
  end
end
