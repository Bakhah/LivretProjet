class AddPseudoToUser < ActiveRecord::Migration
  def self.up
    add_column :monthly_self_examinations, :id, :primary_key
  end

  def self.down
    remove_column :monthly_self_examinations, :id
  end
end
