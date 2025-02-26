class ChangeRoleToIntegerInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :role, 'integer USING CAST(role AS integer)', default: 0, null: false
  end

  def down
    change_column :users, :role, :string
  end
end
