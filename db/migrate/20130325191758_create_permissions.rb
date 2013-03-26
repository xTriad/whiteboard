class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :role_id
      t.text :perm_name

      t.timestamps
    end
  end
end
