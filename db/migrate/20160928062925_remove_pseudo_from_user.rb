class RemovePseudoFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :pseudo, :string
  end
end
