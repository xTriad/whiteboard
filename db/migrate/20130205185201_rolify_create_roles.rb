class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles) do |t|
      t.string :role_name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:user_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:roles, :role_name)
    add_index(:roles, [ :role_name, :resource_type, :resource_id ])
    add_index(:user_roles, [ :user_id, :role_id ])
  end
end
