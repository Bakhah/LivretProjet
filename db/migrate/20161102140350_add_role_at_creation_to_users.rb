class AddRoleAtCreationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_at_creation, :string
  end
end
