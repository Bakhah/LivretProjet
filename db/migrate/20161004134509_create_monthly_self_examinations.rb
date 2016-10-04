class CreateMonthlySelfExaminations < ActiveRecord::Migration
  def change
    drop_table :monthly_self_examinations
    create_table :monthly_self_examinations do |t|
      t.string :periode
      t.string :what_ive_done
      t.string :what_ive_learnt
      t.string :what_ive_felt

      t.timestamps null: false
    end
  end
end
