class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :enterprise_position, :string
    add_column :users, :enterprise_name, :string
  end
end
