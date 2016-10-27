class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :teacher_id, :int
    add_column :users, :tutor_id, :int
  end
end
